## Przechowywanie danych ##

Zadanie postawione przez aplikacja dalece odbiega od typowych zadań aplikacji bazodanowych. Z tego względu relacyjna baza danych SSIE DZIDE TODO.

Główne zadania stawiane przed bazą danych:

* Wylistowanie wszystkich projektów po nazwie
* Przeglądanie drzewa pakietów
* Wyszukiwanie projektów
* Zapis i pobranie skomplikowanej struktury projektu
* Pobranie listy ostatnio zaktualizowanych projektów
* Przechowanie danych dostępowych użytkownika
* Możliwość pracy w środowisku rozproszonym


<!--
http://yuml.me/edit/d0d4436b

[Project|+name;+description]++1-1..*[Version|+id]
[Project]0..*-1<>[User|+login;+email;+name]
[Version]++1-1..*[ScalaVersion|+id]
[ScalaVersion]++1-1..*[Artifact]
[Artifact|+id;+groupId]++-0..*[Dependency|+groupId;+artifactId;+version;+scope]
[Artifact]<>-1..*[ArtifactFile|+type]
-->


Aplikacja pobiera informacje o projektach w dwóch wersjach: podstawowej - tylko nazwa projektu lub pełnej - pełny obiekt projektu wraz ze wszystkimi obiektami podrzędnymi. W przypadku bazy relacyjnej pobranie pełnej wersji projektu wymagałoby wielu skomplikowanych operacji.

Zamiast relacyjnej bazy danych w aplikacji został wykorzystany key-value store (TODO TRANSLATE) Redis^[Redis - [http://redis.io](http://redis.io)].

TODO - co to kurwa jest redis i jak to dziala

### Sposób przechowywania danych ###


W standardowych rozwiązaniach bazujących na bazach relacyjnych model danych jest wspólny dla całej aplikacji, wszystko jest oparte na relacjach między danymi w bazie. W wielu przypadkach prowadzi to do nieefektywnych operacji na bazie danych w celu uzyskania wyniku wymaganego przez funkcjonalność aplikacji. W podejściu KEY-VALUE to funkcjonalność aplikacji narzuca sposób przechowywania danych.

W aplikacji ScalaJars funkcjonalność, a więc także model danych w bazie został podzielony na kilka kluczowych elementów:

* Zapis plików w standardzie Maven
* Przeglądanie i wyszukiwanie projektów przez interfejs webowy
* Przeglądanie drzewa pakietów
* Użytkownicy i kontrola dostępu

### Zapis plików w standardzie Maven  ###

Dla danego artefaktu standard zakłada wysyłanie plików sekwencyjnie w określonej kolejności. Pierwszy zawsze zostanie wysłany plik POM, później `.jar` lub `.war`, na końcu `-sources.jar` oraz `-javadoc.jar`. Nie chroni to jednak aplikacji przed koniecznością przyjęcia kilku artefaktów jednocześnie.W przypadku publikowania projektów dla kilku wersji języka Scala może zajść sytuacja kiedy wiele artefaktów w różnych wersjach będzie publikowanych jednocześnie (w szczególności jeżeli publikacja następuje np. w rezultacie pomyślnego przejścia testów w systemie Continous Integration). 

Struktura projektu jest wielopoziomowym rozległym drzewem. Każde zapytanie publikacji artefaktu modyfikuje jedną konkretną ścieżkę w drzewie od korzenia do ostatniego poziomu. Ze względu na konieczność równoległego przetwarzania modyfikacji wielu ścieżek w tym samym czasie nie można zapisać całego drzewa pod jednym kluczem w bazie danych. Spowodowało by to klasyczne zjawisko wyścigu - utratę danych, a w przypadku zastosowania mechanizmów blokady sekcji krytycznej zdecydowane obniżenie wydajności całej aplikacji.
Synchronizacja dostępu do danych na poziomie procesu aplikacji uniemożliwiłaby wykorzystanie wielu serwerów, a tym samym ograniczyłaby na stałe możliwości skalowania całego projektu.
W celu wyeliminowania konieczności ręcznej synchronizacji danych zostały wykorzystane atomowe operacje dostępne w bazie danych Redis. Do przechowywania informacji o projekcie aplikacja wykorzystuje wbudowane typy danych takie jak `String`, `List` oraz `Set`.

Lista najczęściej wykorzystywanych w aplikacji komend^[Lista dostępnych komend - [http://redis.io/commands](http://redis.io/commands) ]:

--------------------------------------------------------------------
Komenda                   Opis
------------------------  ------------------------------------------
`SET key value`           Ustawienie wartości `value` w polu o kluczu `key`

`GET key`                 Pobranie wartości z pola o kluczu `key`

`SADD key value`          Dodanie wartości `value` do zbioru o kluczu `key`

`SMEMBERS key`            Pobranie wszystkich wartości zbioru o kluczu `key`

`KEYS pattern`            Pobranie listy kluczy pasujących do wzorca `pattern`

`LPUSH key value`         Dodanie wartości `value` na początek listy o kluczu `key`

`LTRIM key offset len`    Usunięcie `len` wartości zaczynając od 
                          indeksu `offset` z listy o kluczu `key`

`LRANGE key offset len`   Pobranie `len` wartości zaczynając od 
                          indeksu `offset` z listy o kluczu `key`
--------------------------------------------------------------------

Przyład różnicy w działaniu atomowych operacji na specjalnych typach danych w porównaniu z prostym zapisem wartości dla danego klucza.

Zwykły zapis wartości:

(`[]` - oznacza zbiór pusty, `[1]` - zbiór zawierający element 1)


Zapytanie A       x         Zapytanie B       y         Wartość w polu `klucz` bazy danych
----------------  --------  ----------------  --------  ----------------------------------
                                                        `[]`
`x = GET klucz`   `[]`                        `[]`      `[]`
                  `[]`      `y = GET klucz`   `[]`      `[]`
`x << 1`          `[1]`                       `[]`      `[]`
                  `[1]`     `y << 2`          `[2]`     `[]` 
`SET klucz x`     `[1]`                       `[2]`     `[1]`
                  `[1]`     `SET klucz y`     `[2]`     `[2]` <- błąd, utrata danych
-----------------------------------------------------------------------------------------

Nastąpiła tutaj utrata danych poprzez nadpisanie wartości. Rozwiązaniem jest wykorzystanie operacji atomowych na zbiorach.

Zapytanie A       Zapytanie B       Wartość w polu `klucz` bazy danych
----------------  ----------------  ----------------------------------
                                    `[]`
`SADD klucz 1`                      `[1]`
                  `SADD klucz 2`    `[1,2]`
----------------------------------------------------------------------

W tym przypadku nie ma zjawiska wyścigu - nie następuje utrata danych.



![Schemat bazy danych\label{fig-data}](assets/data.pdf)

Zależności między danymi pokazane są na rysunku \ref{fig-data}.


  <!-- [02:29:39] <teamon> http://d.pr/i/ZMTN
  [02:29:41] <teamon> rzyg
  [02:32:01] xwid (~kasper@afgr3.neoplus.adsl.tpnet.pl) joined the channel.
  [02:33:49] <teamon> bo tu jest (n+1)^3
  [02:35:26] <teamon> ale juz wiem czemu tak zrobilem
  [02:35:44] <teamon> zeby nie mergowac recznie
  [02:35:52] <teamon> bo moglaby byc jazda z synchronizacja
  [02:35:55] <teamon> setow np
  [02:36:11] <teamon> jak w parallel ktos by wrzucil kilka artefaktow na raz
  [02:36:14] <teamon> to by sie moglo zjebac
  [02:36:21] <teamon> a tak redis mi to atomowo zalatwia
  [02:36:32] <teamon> kurwa jednak jestem genialny :D -->


  Informacje o projektach sa zapisywane w bazie pod specjalnymi kluczami.

  Oznaczenia:

  * `P` - nazwa projektu
  * `V` - wersja
  * `S` - wersja języka Scala
  * `A` - nazwa artefaktu

  \blandscape

  Klucz                                                                 Typ         Opis
  -------------------------------------------------------------------   --------    -------------------
  `projects`                                                            Set         Zbiór nazw projektów
  `projects:P`                                                          String      Podstawowe dane projektu
  `projects:P:versions`                                                 Set         Zbiór wersji projektu
  `projects:P:versions:V:scalaVersions`                                 Set         Zbiór wersji języka Scala
  `projects:P:versions:V:scalaVersions:S:artifacts`                     Set         Zbiór artefaktów
  `projects:P:versions:V:scalaVersions:S:artifacts:A:dependencies`      Set         Zbiór zależności artefaktu
  `projects:P:versions:V:scalaVersions:S:artifacts:A:files`             String      Dostępne pliki dla artefaktu

  \elandscape

Taka struktura umożliwia bezproblemową modyfikacje wielu ścieżek w drzewie projektu bez ryzyka utraty danych.


### Przeglądanie i wyszukiwanie projektów przez interfejs webowy ###

Podstawowe wyszukiwanie projektów polega na wpisaniu pełnej lub części nazwy. Operacje wyszukania kluczy pasujących do wzorca można wykonać za pomocą komendy `KEYS pattern` gdzie `pattern` jest ciągiem znaków mogącym zawierać znaki specjalne takie jak '*' oznaczające zero lub więcej dowolnych znaków. Ze względu na strukturę kluczy wyszukiwanie ciągu `query` za pomocą komendy
`KEYS projects:query*` zwróciłoby wiele rezultatów dla tego samego projektu. 

Rozwiązaniem tego problemu jest stworzenie osobnego indeksu zawierającego tylko nazwy projektów. Każdy projekt zostaje dodatkowo zapisany pod kluczem
`projects-index:P` z pustą wartością, gdzie `P` oznacza nazwę projektu. Pozwala to na wyszukiwanie ciągu `query` za pomocą komendy `KEYS projects-index:query*` i uzyskanie poprawnych wyników.

Pełne informacje dotyczące projektu są pobierane na podstawie jego nazwy `P`poprzez `GET projects:P`, a następnie wywołanie podobnych komend z odpowiednimi kluczami wgłąb drzewa projektu.

### Przeglądanie drzewa pakietów ###

Ważną funkcjonalnością obok przeglądania projektów po nazwie jest indeks artefaktów. Dla projektu scalaz indeks ma postać:

```
* org
  * scalaz
    * scalaz-core_2.8.0
      * 7.0.0
        * scalaz-core_2.8.0-7.0.0.pom
        * scalaz-core_2.8.0-7.0.0.jar
    * scalaz-core_2.9.1
      * 7.0.0
        * scalaz-core_2.9.1-7.0.0.pom
        * scalaz-core_2.9.1-7.0.0.jar
    * scalaz-typelevel_2.8.0
      * 7.0.0
        * scalaz-typelevel_2.8.0-7.0.0.pom
        * scalaz-typelevel_2.8.0-7.0.0.jar
    * scalaz-typelevel_2.9.1
      * 7.0.0
        * scalaz-typelevel_2.9.1-7.0.0.pom
        * scalaz-typelevel_2.9.1-7.0.0.jar
```

Struktura ta odpowiada strukturze folderów i plików zapisanych na dysku. Najprostszym rozwiązaniem byłoby odwołanie się do systemu plików i wyświetlenie listy dostępnych artefaktów w danym folderze. Takie rozwiązanie jest jednak wysoce niewydajne, a także ogranicza możliwość zmiany miejsca i struktury przechowywania plików.

Zamiast odwoływać się do systemu plików w aplikacji został stworzony indeks w bazie danych. Ścieżką w systemie plików odpowiada klucz w indeksie, a wartość odpowiada zawartości danego katalogu. Jako wartość został ponownie wykorzystany typ danych `Set`.

Schemat budowy indeksu najlepiej zobrazuje przykład:

\blandscape

~~~~~~~~        
Klucz                                           Wartość
=========================================================================================================================                                                      
index:org                                       {"name": "scalaz",                                    "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz                                {"name": "scalaz-core_2.8.0",                         "_type": "package"}
                                                {"name": "scalaz-core_2.9.1",                         "_type": "package"}
                                                {"name": "scalaz-typelevel_2.8.0",                    "_type": "package"}
                                                {"name": "scalaz-typelevel_2.9.1",                    "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-core_2.8.0              {"name": "7.0.0",                                     "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-core_2.8.0:7.0.0        {"name": "scalaz-core_2.8.0-7.0.0.pom",               "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0.pom.md5",           "_type": "file"}
                                                {"name": "scalaz-core_2.8.0-7.0.0.pom.sha1",          "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0.jar",               "_type": "file"}
                                                {"name": "scalaz-core_2.8.0-7.0.0.jar.md5",           "_type": "file"}
                                                {"name": "scalaz-core_2.8.0-7.0.0.jar.sha1",          "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0-javadoc.jar",       "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0-javadoc.jar.md5",   "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0-javadoc.jar.sha1",  "_type": "file"}
                                                {"name": "scalaz-core_2.8.0-7.0.0-sources.jar",       "_type": "file"}
                                                {"name": "scalaz-core_2.8.0-7.0.0-sources.jar.md5",   "_type": "file"}    
                                                {"name": "scalaz-core_2.8.0-7.0.0-sources.jar.sha1",  "_type": "file"}    
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-core_2.9.1              {"name": "7.0.0",                                     "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-core_2.9.1:7.0.0        ...
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-typelevel_2.8.0         {"name": "7.0.0",                                     "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-typelevel_2.8.0:7.0.0   ...     
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-typelevel_2.9.1         {"name": "7.0.0",                                     "_type": "package"}
-------------------------------------------------------------------------------------------------------------------------
index:org:scalaz:scalaz-typelevel_2.8.0:7.0.0   ...    

~~~~~~~~

\elandscape


### Użytkownicy i kontrola dostępu ###

Ze względu na wykorzystanie serwisu GitHub jako dostawce autoryzacji użytkowników po stronie aplikacji wystarczy jedynie zapisać podstawowe dane użytkownika oraz wygenerowany dla niego unikalny token dostępowy do publikacji.

Użytkownicy są zapisywani jako obiekt pod kluczem `users:L`, gdzie `L` oznacza login użytkownika w serwisie GitHub. Obiekt zawiera pola takie jak email czy imię i nazwisko.

```
Klucz           Wartość
====================================================================================
users:teamon    {"login": "teamon", "email": "i@teamon.eu", "name": "Tymon Tobolski"}
```

Token użytkownika jest wykorzystywany w dwóch przypadkach: przy wyświetleniu tokena użytkownikowi oraz przy kontroli dostępu sprawdzaniu podczas publikacji. Sprowadza się to prostych operacji: pobranie tokenu znając nazwę użytkownika oraz pobranie nazwy użytkownika znając token. W tyl celu w bazie są zapisywane dla pola: pierwsze o kluczu `users-to-tokens:L` i wartości `T`, a drugie o kluczu `tokens-to-users:T` i wartości `L`, gdzie `L` oznacza nazwę użytkownika, a `T` token.

```
Klucz                                         Wartość
========================================================================
users-to-tokens:teamon                        5nqrd6slef10414jiosh4rton6
tokens-to-users:5nqrd6slef10414jiosh4rton6    teamon
```

Pozwala to na szybkie pobranie potrzebnych wartości bez potrzeby wykonywania skomplikowanych operacji.

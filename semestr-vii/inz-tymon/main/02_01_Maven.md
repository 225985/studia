## Standard Maven ##

W celu zachowania kompatybilności z istniejącymi narzędziami aplikacja implementuje protokół używany przez najpopularnieszy obecnie w środowisku JVM system publikacji projektów Maven. Standard ten określa w jaki sposób projekty są publikowane oraz pobierane. Wprowadza on koncept repozytoriów; każde repozytorium składa się z adresu URL który jest używany jako adres bazowy dla wszystkich operacji. 

Przykładowy adres URL repozytorium TypeSafe:

```
http://repo.typesafe.com/typesafe/releases/
```

Publikacja odbywa się poprzez wysłanie zapytania HTTP PUT na określony adres URL którego ciało zawiera treść pliku.
Adres URL składa się z pakietu, nazwy, wersji oraz nazwy pliku.

Schemat adresu:

```
PUT http://repozytorium/pakiet/nazwa/wersja/nazwa-artefaktu-wersja-rozszerzenie
```

Dla przykładu skompilowany moduł (`.jar`) `lucene-core` z projektu Apache Lucene w wersji 3.6.1 zostanie wysłany pod adres

```
PUT http://repozytorium/org/apache/lucene/lucene-core/3.6.1/lucene-core-3.6.1.jar
```

Standard Maven pozwala na zagnieżdżanie projektów w podprojekty. Każdy moduł definiuje artefakt. Definicja artefaktu jest dość szeroka, z reguły jest to plik `.jar` ze skompilowanym kodem. W przypadku projektów zawierających aplikacje webowe używa się rozszerzenia `.war`. Podczas publikacji przysyłane są też inne pliki takie jak:

* `.pom` - Plik XML zawierający informacje o artefakcie, m.in. jego zależności
* `-sources.jar` - Skompresowane źródła projektu (opcjonalne)
* `-javadoc.jar` - Skompresowana dokumentacja artefaktu (opcjonalne)

Przykładowo, pełna publikacja projektu Apache Lucene składającego się z modułów `lucene-core` oraz `lucene-queries` we wersji 3.6.1 wymagałaby następujących operacji:

```
PUT http://.../org/apache/lucene/lucene-core/3.6.1/lucene-core-3.6.1.pom
PUT http://.../org/apache/lucene/lucene-core/3.6.1/lucene-core-3.6.1.jar
PUT http://.../org/apache/lucene/lucene-core/3.6.1/lucene-core-3.6.1-sources.jar
PUT http://.../org/apache/lucene/lucene-core/3.6.1/lucene-core-3.6.1-javadoc.jar
PUT http://.../org/apache/lucene/lucene-queries/3.6.1/lucene-queries-3.6.1.pom
PUT http://.../org/apache/lucene/lucene-queries/3.6.1/lucene-queries-3.6.1.jar
PUT http://.../org/apache/lucene/lucene-queries/3.6.1/lucene-queries-3.6.1-sources.jar
PUT http://.../org/apache/lucene/lucene-queries/3.6.1/lucene-queries-3.6.1-javadoc.jar
```

Każda wersja kompilatora języka Java jest kompatybilna wstecz, nie ma problemów z używaniem projektu skompilowanego za pomocą kompilatora javac 1.3 w projekcie który wykorzystuje kompilator javac 1.4 lub nowszy. W przypadku projektów w języku Scala pojawiła się pewna trudność w wersjonowaniu artefaktów. Ze względu na bardzo dynamiczny rozwój języka nowe wersje kompilatora scalac są wydawane stosunkowo często i nie są ze sobą kompatybilne binarnie. Kompatybilność wsteczna jest zachowana jedynie w przypadku numeru wydania[^1].

Oznacza to tyle, że projekt skompilowany kompilatorem scalac w wersji 2.7.x nie może być użyty w innym projekcie używającym kompilatora w wersji 2.8.x. Zależność ta działa w obie strony, projekt skompilowany pod 2.8.x nie może być wykorzystany pod 2.7.x. 

W celu rozwiązania problemu niekompatybilności między wersjami kompilatora (nie tracąc przy tym ogólnej kompatybilności z systemem Maven) zastosowano prostą konwencje w nazewnictwie artefaktów.

```
nazwa-artefaktu-do-publikacji = nazwa-artefaktu_wersja-kompilatora
```

Dla przykładu biblioteka scalaz w wersji 7.0.0 skompilowana kompilatorem scalac w wersjach 2.8.0 oraz 2.9.1 zostanie opublikowana z następującymi artefaktami:

* `scalaz-core_2.8.0-7.0.0.jar`
* `scalaz-typelevel_2.8.0-7.0.0.jar`
* `scalaz-core_2.9.1-7.0.0.jar`
* `scalaz-typelevel_2.9.1-7.0.0.jar`

W celu ułatwienia publikowania projektów poprzez sbt wprowadzone zostało kompilowanie projektu dla wielu wersji języka Scala jednocześnie (`cross-compiling`).


Standard maven określa także sposób pobierania projektów jako zależności w innych projektach. Odbywa się to dwuetapowo. W celu pobrania artefaktu Maven przeszukuje dostępne repozytoria za pomocą zapytań HTTP HEAD.

Schemat adresu:
```
HEAD http://repozytorium/pakiet/nazwa/wersja/nazwa-artefaktu-wersja-rozszerzenie
```

Serwer powinien zwrócić ściśle określona odpowiedz:

* w przypadku gdy dany artefakt znajduje się w repozytorium
    * Status HTTP: 200 `Found`
    * Nagłówki HTTP:
        * `Content-Type`[^2] - typ pliku
        * `Content-Length` - rozmiar pliku
* w przypadku gdy danego artefaktu nie ma w repozytorium
    * Status HTTP: 404 `Not Found`

Gdy serwer repozytorium odpowie statusem 200 `Found` Maven wysyła zapytanie HTTP GET na ten sam adres URL co przy zapytaniu HEAD. Serwer powinien wysłać wtedy dokładnie takie same nagłówki co w przypadku zapytania HEAD oraz treść pliku w ciele odpowiedzi.

W przypadku gdy w żadnym z dostępnych repozytoriów nie ma dostępnego danego artefaktu Maven zwróci błąd użytkownikowi.

Ponadto Maven najpierw pobiera plik `.pom`, aby sprawdzić zależności danego artefaktu i pobrać je w dokładnie taki sam sposób jak opisany powyżej.

[^1]: [Numeracja wersji oprogramowania](ttp://pl.wikipedia.org/wiki/Numeracja_wersji_oprogramowania)

[^2]: [MIME Content-Type](http://en.wikipedia.org/wiki/MIME#Content-Type )

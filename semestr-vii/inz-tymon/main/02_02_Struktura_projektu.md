## Struktura projektu ##

Ze względu na różnice w wersjonowaniu i nazewnictwie projektów obecnie żaden serwis umożliwiający publikacje nie jest przystosowany do projektów w języku Scala. W większości tego typu rozwiązań brakuje nawet logicznego podziału na projekty i podprojekty. 

Najczęściej spotykana struktura artefaktów:

```
* scalaz-core_2.8.0
    * 7.0.0
        * scalaz-core_2.8.0-7.0.0.jar
        * scalaz-core_2.8.0-7.0.0.pom
* scalaz-core_2.9.1
    * 7.0.0
        * scalaz-core_2.9.1-7.0.0.jar
        * scalaz-core_2.9.1-7.0.0.pom
* scalaz-typelevel_2.8.0
    * 7.0.0
        * scalaz-typelevel_2.8.0-7.0.0.jar
        * scalaz-typelevel_2.8.0-7.0.0.pom
* scalaz-typelevel_2.9.1
    * 7.0.0
        * scalaz-typelevel_2.9.1-7.0.0.jar
        * scalaz-typelevel_2.9.1-7.0.0.pom
```

Brakuje tutaj wspomnianego podziału na podprojekty, przeszukiwanie takiego repozytorium projektów pozostawia wiele do życzenia.

W niektórych serwisach można spotkać następująca strukturę:

```
* sclaz
    * scalaz-core_2.8.0
        * 7.0.0
            * scalaz-core_2.8.0-7.0.0.jar
            * scalaz-core_2.8.0-7.0.0.pom
    * scalaz-core_2.9.1
        * 7.0.0
            * scalaz-core_2.9.1-7.0.0.jar
            * scalaz-core_2.9.1-7.0.0.pom
    * scalaz-typelevel_2.8.0
        * 7.0.0
            * scalaz-typelevel_2.8.0-7.0.0.jar
            * scalaz-typelevel_2.8.0-7.0.0.pom
    * scalaz-typelevel_2.9.1
        * 7.0.0
            * scalaz-typelevel_2.9.1-7.0.0.jar
            * scalaz-typelevel_2.9.1-7.0.0.pom
```

W tym przypadku artefakt o tej samej nazwie ale innej wersji kompilatora scala jest traktowany jak dwa osobne artefakty.

Poprawna struktura projektu:

```
* scalaz
    * 7.0.0
        * 2.8.0
            * scalaz-core
                * scalaz-core_2.8.0-7.0.0.jar
                * scalaz-core_2.8.0-7.0.0.pom
            * scalaz-typelevel
                * scalaz-typelevel_2.8.0-7.0.0.jar
                * scalaz-typelevel_2.8.0-7.0.0.pom
        * 2.9.1
            * scalaz-core
                * scalaz-core_2.9.1-7.0.0.jar
                * scalaz-core_2.9.1-7.0.0.pom
            * scalaz-typelevel
                * scalaz-typelevel_2.9.1-7.0.0.jar
                * scalaz-typelevel_2.9.1-7.0.0.pom
```

Powyższa struktura uwzględnia podział na podprojekty oraz wersje języka Scala. Umożliwia ona sprawne wyszukanie konkretnej wersji projektu dla wymaganej wersji kompilatora. Właśnie taka struktura została wykorzystana przy tworzeniu aplikacji ScalaJars.

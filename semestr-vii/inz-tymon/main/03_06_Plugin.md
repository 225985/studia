## Plugin sbt ##

Kluczowym elementem procesu publikacji jest poprawne skonfigurowanie narzędzi używanych podczas pracy na projektem. Najbardziej popularnym tego typu narzędziem w środowisku języka Scala jest sbt[^sbt]. Konfiguracja polega na ustawieniu repozytorium do którego mają zostać wysłane skompilowane artefakty[^sbt-publishing].

Przykład konfiguracji (plik `build.sbt`):

```scala
publishTo := Some("Nazwa" at "http://adres/repozytorium")
```

Ze względu na architekturę ScalaJars wymaga podania nazwy projektu oraz tokenu użytkownika w adresie repozytorium. Wpisanie tokenu w pliku `build.sbt` naraża użytkownika na nieautoryzowany dostęp osób trzecich do jego projektów w systemie ScalaJars, w szczególności jeśli projekt jest udostępniany na licencji OpenSource i każdy może zobaczyć jego kod źródłowy w tym także pliki konfiguracyjne sbt. Ignorowanie lub usuwanie tokenu z pliku `build.sbt` przy każdej aktualizacji kodu w systemie kontroli wersji jest uciążliwe i podatne na omyłkowe upublicznienie tokenu.
Rozwiązaniem tego problemu jest umieszczenie tokenu użytkownika poza katalogiem projektu. Poza względami bezpieczeństwa ułatwia to też ewentualną zmianę tokenu bez konieczności edycji konfiguracji każdego projektu osobno. Aby maksymalnie uprościć cały ten proces został stworzony plugin do sbt - `sbt-scalajars`. Plugin ten generuje konfigurację publikacji projektu na podstawie ustalonej nazwy projektu oraz pliku `.scalajars` w katalogu domowym użytkownika.
Instalacja oraz konfiguracja pluginu sprowadza się do dwóch prostych kroków:

1. Dodanie pluginu do pliku `plugins.sbt`

```scala
addSbtPlugin("org.scalajars" %% "sbt-scalajars" % "0.1.0")
```

2. Ustawienie nazwy projektu w pliku `build.sbt`

```scala
seq(scalajarsSettings:_*)

scalajarsProjectName := "nazwa-projektu"
```

Podczas ewaluacji ustawień plugin nadpisuje parametr `publishTo` wartością:

```scala
publishTo := Some("ScalaJars" at "http://scalajars.org/publish/projekt/token")
```

gdzie `projekt` jest nazwą projektu pobieraną z parametru `scalajarsProjectName` a `token` z pliku `.scalajars`.


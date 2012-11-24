# Wprowadzenie

## Cel pracy ##

Celem niniejszego projektu inżynierskiego jest zaprojektowanie oraz implementacja aplikacji internetowej służącej do publikacji projektów OpenSource w języku Scala[^scala].

Ze względu na duży wpływ środowiska języka Java biblioteki języka Scala są dystrybuowane jako pakiety `.jar`. Publikacja biblioteki najczęściej sprowadza się do utrzymania własnego serwera, a korzystanie z takich biblioteki wymaga znania dokładnego położenia danej biblioteki. Dla porównania, w środowiskach innych języków taki jak Ruby[^rubygems] czy Clojure[^clojars] istnieje jedno centralne miejsce dla bibliotek OpenSource.

## Istniejące rozwiązania ##

Nieduże projekty, często prowadzone przez jedną osobę, w dużej części nie są publikowane w formie gotowych pakietów, a jedynie w formie kodu źródłowego. Powoduje to duże niedogodności z wykorzystaniem takich projektów i aktualizacją do nowych wersji. Niektórzy autorzy bibliotek publikują pakiety na własnych serwerach co wymaga od nich utrzymywania serwera i robienie ręcznych aktualizacji. Najczęściej jest to zwykły serwer plików nieposiadający możliwości przeszukiwania projektów, w innych przypadkach skomplikowane w instalacji, konfiguracji i użyciu narzędzia takie jak Artifactory[^artifactory]. Utrzymanie własne serwera wiąże się z kosztami oraz wymaga pamiętania lokalizacji pakietów projektu przez jego użytkowników. Sytuacja taka ma związek z trudnościami związanymi z publikacją pakietów w globalnych serwisach takich jak Maven Central[^central] czy Sonatype[^sonatype]. Celem projektu ScalaJars jest uwolnienie autorów projektów od konieczności utrzymywanie własnej infrastruktury oraz uproszczenie publikacji pakietów w serwisie specjalnie przygotowanym dla bibliotek w języku Scala. 


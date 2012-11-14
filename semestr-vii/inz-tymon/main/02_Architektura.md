# Architektura #


## Autoryzacja ##

W celu maksymalnego uproszczenia procesu publikacji projektów aplikacja nie posiada standardowego mechanizmu rejestracji oraz logowania użytkowników poprzez login/email i hasło. Użytkownicy niechętnie podają swój adres email w nowych serwisach internetowych ze względu na obawy przed niechcianą pocztą. Wiązałoby się to też z koniecznością wymyślenia i zapamiętania kolejnego hasła przez użytkownika.

Standardowe podejście wymagałoby zaimplementowania mechanizmu rejestracji, logowania, przypomnienia hasła oraz jego zmiany. Również przechowywanie haseł użytkowników jest nietrywialne ze względów bezpieczeństwa.

Zamiast normalnej rejestracji autoryzacja użytkowników w serwisie odbywa się przy pomocy mechanizmu OAuth[^1] w wersji 2.0. Pozwala on na autoryzacje użytkowników jak i dzielenie się prywatnymi informacjami przechowywanymi w jednym serwisie z innym. OAuth jest obecnie najpopularniejszym otwartym standardem autoryzacji używanym w internecie. Znaczna część serwisów z których każdy kożysta na codzień umożliwia rejestracje za pomocą standardu OAuth. 

### Schemat działania standardu OAuth ###

W standardzie OAuth2 występują trzy głowne elementy:

  * Użytkownik
  * Aplikacja - serwis który chce uzyskać dostęp do informacji o użytkowniku
  * Dostawca (_ang. provider_) - serwis w którym użytkownik posiada konto

Najpopularniejszymi dostawcami OAuth są m.in. Google[^2], Facebook[^3] oraz Twitter[^4]. Ze względu na charakter aplikacji jest ona skierowana głównie do programistów, dlatego też jako dostawca OAuth został wybrany serwis skupiający największą społeczność OpenSource - GitHub[^5].

Aby aplikacja mogła uzyskać dostęp do danych użytkownika przechowywanych u konkretnego dostawcy należy ją zarejestrować u dostawcy. Konfiguracja aplikacji polega na pobraniu unikalnego identyfikatora (`client_id`) oraz tajnego klucza (`client_secret`).

Schemat działania znajduje się na rysunku \ref{fig-oauth}.


![Schemat działania standardu OAuth\label{fig-oauth}](assets/oauth.pdf)

1. Aplikacja przekierowuje użytkownika na stronę dostawcy. Parametry przekierowania to:
  * `client_id` - unikalny identyfikator aplikacji
  * `redirect_uri` - adres URL na który ma być przekierowany użytkownik po udanej autoryzacji
  * `scope` (opcjonalny) - określa zakres danych do których aplikacja chce uzyskać dostęp
2. Użytkownik loguje się na stronie dostawcy, dostawca generuje nowy token autoryzacji (`request_token`) i przekierowuje użytkownika na podany przez aplikacje adres URL (`redirect_uri`) wraz z załączonym tokenem.
3. Aplikacja wysyła żadanie do dostawcy o token dostępu (`access_token`). Wymagane parametry zapytania to:
  * `client_id` - ten sam co w punkcie 1
  * `client_secret` - tajny klucz aplikacji
  * `request_token` - token autoryzacji użytkownika
4. Dostawca autoryzuje aplikacje i w odpowiedzi odsyła token dostępu (`access_token`)
5. Aplikacja wykorzystuje token dostępu (`access_token`) aby uzyskać informacje o użytkowniku.


### Kontrola dostępu do projektów ###

Po pomyślnej autoryzacji każdemu użytkownikowi zostaje przypisany unikalny token pozwalający na publikacje projektów. Token ten jest dostępy dla użytkownika po zalogowaniu. W razie potrzeby istnieje także możliwość ponownego wygenerowania tokena.



## Przechowywanie danych ##

Zadanie postawione przez aplikacja dalece odbiega od typowych zadań aplikacji bazodanowych. Z tego względu relacyjna baza danych SSIE DZIDE TODO.

Główne zadania stawiane przed bazą danych:

* Wylistowanie wszystkich projektów po nazwie
* Przeglądanie drzewa pakietów
* Wyszukiwanie projektów
* Zapis i pobranie skomplikowanej struktury projektu
* Pobranie listy ostatnio zaktualizowanych projektów
* Przechowanie danych dostępowych użytkownika


<!--
http://yuml.me/edit/d0d4436b

[Project|+name;+description]++1-1..*[Version|+id]
[Project]0..*-1<>[User|+login;+email;+name]
[Version]++1-1..*[ScalaVersion|+id]
[ScalaVersion]++1-1..*[Artifact]
[Artifact|+id;+groupId]++-0..*[Dependency|+groupId;+artifactId;+version;+scope]
[Artifact]<>-1..*[ArtifactFile|+type]
-->

![Schemat bazy danych\label{fig-data}](assets/data.pdf)

Zależności między danymi pokazane są na rysunku \ref{fig-data}.

Aplikacja pobiera informacje o projektach w dwóch wersjach: podstawowej - tylko nazwa projektu lub pełnej - pełny obiekt projektu wraz ze wszystkimi obiektami podrzędnymi. W przypadku bazy relacyjnej pobranie pełnej wersji projektu wymagałoby wielu skomplikowanych operacji.

Zamiast relacyjnej bazy danych w aplikacji został wykorzystany key-value store (TODO TRANSLATE) Redis.[^6]

TODO - co to kurwa jest redis i jak to dziala

### Sposów przechowywania danych ###

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

## Przeglądanie

## Plugin do sbt


 [^1]: [OAuth - http://oauth.net](http://oauth.net)

 [^2]: [Google - http://google.com](http://google.com)

 [^3]: [Facebook - http://facebook.com](http://facebook.com)

 [^4]: [Twitter - http://twitter.com](http://twitter.com)

 [^5]: [GitHub - http://github.com](http://github.com)

 [^6]: [Redis - http://redis.io](http://redis.io)

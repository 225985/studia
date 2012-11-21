## Autoryzacja ##

W celu maksymalnego uproszczenia procesu publikacji projektów aplikacja nie posiada standardowego mechanizmu rejestracji oraz logowania użytkowników poprzez login/email i hasło. Użytkownicy niechętnie podają swój adres email w nowych serwisach internetowych ze względu na obawy przed niechcianą pocztą. Wiązałoby się to też z koniecznością wymyślenia i zapamiętania kolejnego hasła przez użytkownika.

Standardowe podejście wymagałoby zaimplementowania mechanizmu rejestracji, logowania, przypomnienia hasła oraz jego zmiany. Również przechowywanie haseł użytkowników jest nietrywialne ze względów bezpieczeństwa.

Zamiast normalnej rejestracji autoryzacja użytkowników w serwisie odbywa się przy pomocy mechanizmu OAuth^[OAuth - [http://oauth.net](http://oauth.net)] w wersji 2.0. Pozwala on na autoryzacje użytkowników jak i dzielenie się prywatnymi informacjami przechowywanymi w jednym serwisie z innym. OAuth jest obecnie najpopularniejszym otwartym standardem autoryzacji używanym w internecie. Znaczna część serwisów z których każdy korzysta na co dzień umożliwia rejestracje za pomocą standardu OAuth. 

### Schemat działania standardu OAuth ###

W standardzie OAuth2 występują trzy główne elementy:

  * Użytkownik
  * Aplikacja - serwis który chce uzyskać dostęp do informacji o użytkowniku
  * Dostawca (_ang. provider_) - serwis w którym użytkownik posiada konto

Najpopularniejszymi dostawcami OAuth są m.in. Google^[Google - [http://google.com](http://google.com)], Facebook^[Facebook - [http://facebook.com](http://facebook.com)] oraz Twitter^[Twitter - [http://twitter.com](http://twitter.com)]. Ze względu na charakter aplikacji jest ona skierowana głównie do programistów, dlatego też jako dostawca OAuth został wybrany serwis skupiający największą społeczność OpenSource - GitHub^[GitHub - [http://github.com](http://github.com)].

Aby aplikacja mogła uzyskać dostęp do danych użytkownika przechowywanych u konkretnego dostawcy należy ją zarejestrować u dostawcy. Konfiguracja aplikacji polega na pobraniu unikalnego identyfikatora (`client_id`) oraz tajnego klucza (`client_secret`).

Schemat działania znajduje się na rysunku \ref{fig-oauth}.


![Schemat działania standardu OAuth\label{fig-oauth}](assets/oauth.pdf)

1. Aplikacja przekierowuje użytkownika na stronę dostawcy. Parametry przekierowania to:
  * `client_id` - unikalny identyfikator aplikacji
  * `redirect_uri` - adres URL na który ma być przekierowany użytkownik po udanej autoryzacji
  * `scope` (opcjonalny) - określa zakres danych do których aplikacja chce uzyskać dostęp
2. Użytkownik loguje się na stronie dostawcy, dostawca generuje nowy token autoryzacji (`request_token`) i przekierowuje użytkownika na podany przez aplikacje adres URL (`redirect_uri`) wraz z załączonym tokenem.
3. Aplikacja wysyła żądanie do dostawcy o token dostępu (`access_token`). Wymagane parametry zapytania to:
  * `client_id` - ten sam co w punkcie 1
  * `client_secret` - tajny klucz aplikacji
  * `request_token` - token autoryzacji użytkownika
4. Dostawca autoryzuje aplikacje i w odpowiedzi odsyła token dostępu (`access_token`)
5. Aplikacja wykorzystuje token dostępu (`access_token`) aby uzyskać informacje o użytkowniku.


### Kontrola dostępu do projektów ###

Po pomyślnej autoryzacji każdemu użytkownikowi zostaje przypisany unikalny token pozwalający na publikacje projektów. Token ten jest dostępy dla użytkownika po zalogowaniu. W razie potrzeby istnieje także możliwość ponownego wygenerowania tokena.

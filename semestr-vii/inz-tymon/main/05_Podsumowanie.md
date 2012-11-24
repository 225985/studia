# Podsumowanie

## Napotkane problemy ##

Największym wyzwaniem podczas budowy aplikacji ScalaJars była architektura bazy danych. Ze względu wykorzystanie bazy danych Redis nie można było zastosować powszechnego modelowania tak jak w przypadku baz relacyjnych.


## Kierunki i możliwości rozwoju aplikacji ##

Głównym ograniczeniem obecnej wersji aplikacji jest przechowywanie plików na dysku lokalnym. W przypadku konieczności skalowania na wiele serwerów należałoby skorzystać z rozproszonej struktury przechowywania plików takiej jak np. Amazon S3[^s3]. Pozwoliłoby to na użycie dowolnej ilości serwerów aplikacyjnych.

Istniejące funkcjonalności katalogu projektów można by poszerzyć o bardziej rozbudowaną strukturę, np. dodanie słów kluczowych do projektów co pozwoliłoby na bardziej sprawne wyszukiwanie projektów o danym przeznaczeniu. Ponadto dla samego projektu warto by było dodać możliwość podania odnośników do kodu źródłowego czy strony internetowej autora. Interesująca funkcjonalnością byłaby także możliwość przeglądania dokumentacji projektu bez konieczności pobierania plików JavaDoc. 

Kolejnym etapem rozwoju aplikacji mogłoby być dodanie obsługi kolaborantów - umożliwienie kilku użytkownikom publikowanie danego projektu. 

Ważną funkcjonalnością dla firm tworzących oprogramowanie w języku Scala byłaby możliwość publikowania projektów prywatnych, do których dostęp mieliby tylko uprawnieni użytkownicy.

Dużo trudniejszą i wymagającą więcej zasobów funkcjonalnością byłby system automatycznej kompilacji i publikowania artefaktów w momencie opublikowania nowej wersji kodu źródłowego w serwisie GitHub. Pozwoliłoby to użytkownikom danego projektu bezproblemowy dostęp do najnowszych wersji oraz zwalniałoby autora projektu z konieczności ręcznej publikacji przy wydawaniu nowych wersji projektu.


# Komponenty wykorzystywane w projekcie #

## C# i .NET ##

C# jest obiektowym językiem programowania stworzonym dla firmy Microsoft przez zaspół Andersa Hejslberga. Język ten powstał jako alternatywa dla Javy. Programy napisane w C# kompilowane są do natywnego języka Common Intermediate Language (CLI), czyli kodu pośredniego w środowisku takim jak .NET czy Mono.

.NET Framework jest platformą programistyczną obejmującą środowisko uruchomieniowe CLR (Common Language Runtime) oraz biblioteki klas z podstawowymi funkcjonalnościami. Zadaniem .Net jest zarządzanie elementami systemu, takimi jak : kod aplikacji, pamięć oraz zabezpieczenia. .NET umożliwia uruchamianie aplikacji zarówno na systemie, w którym istnieje działająca implementacja platformy, a także po stronie serwera IIS. Platforma .NET nie określa jednoznacznie języka programowania. Aplikacje działające na niej mogą być napisane w C#, F#, J#, VB.NET, C++/CLI czy Delphi 8. 

## Framework ASP.NET MVC 3#

ASP.NET MVC 3 jest platformą do budowy aplikacji internetowych korzystającą z wzorca MVC (Model - Widok - Kontroler) bazującej na platformie ASP.NET. Zaletą z korzystania ze wzorca MVC jest odseparowanie warstw aplikacji i logiki biznesowej. Aplikacje stworzone za pomocą tego frameworka są z reguły łatwiejsze w rozbudowie i testowaniu (testy jednostkowe).

ASP.NET MVC bazuje na tradycyjnym silniku ASP.NET, dzięki czemu można wykorzystać wiele mechanizmów stworzonych dla tej platformy jak zarządzanie cachem, autoryzacja czy monitorowanie. Mechanizm mapowania adresów umożliwia łatwą budowę aplikacji w oparciu o architekturę REST. Model programistyczny silnie bazuje na interfejsach, co pozwala na łatwą rozbudowę i testowanie komponentów.

## Windows Communication Foundation ##

Windows Communication Foundation (w skrócie WCF) jest platformą służącą do budowy aplikacji zorientowanych serwisowo. Pozwala na budowę aplikacji, które mogą działać na serwerze IIS lub jako część systemu. WCF pozwala na komunikację między platformową za pomocą technologii SOAP prz użyciu prostych formatów XML lub JSON. Kluczowym aspektem biznesowym platformy WCF jest zapewnienie wysokiej wydajności, przy równie wysokiej niezawodności działania systemu.

## Baza daynych ##

### Microsoft SQL Server 2012 ###
Microsoft SQL Server (MS SQL) to system zarządzania relacyjnymi bazami danych. Jako język zapytań używany jest Transact-SQL będący rozwinięciem standardu ANSi/ISO. MS SQL jest platformą bazodanową typu klient-serwer charakteryzującą się wysoką wydajnością, niezawodnością i bezpieczeństwem.

### SQLite ###
SQLite jest systemem zarządzania bazą danych i biblioteką języka C, implementującą taki system. Charakteryzuje się przetrzymywaniem danych w jednym pliku (do 2 TB). Baza utrzymywana jest przy użyciu B-drzewa. Bazy danych zapisywane są jako pliki binarne. SQLite jest szeroko wykorzystywany w systemach wbudowanych jak i przez platformę Android.

## Windows Azure ##
Windows Azure jest platwormą chmurową stworzoną przez firmę Microsoft. Udostępnia ona mechanizmy do przetwarzania danych (Windows Azure Compute) oraz do ich przechowywania (Windows Azure Storage  i SQL Azure).

Windows Azure pozwala na budowanie aplikacji we wsztskich technologiach, które można wykorzystać na zwykłym systemie Windows. Poza C# i innymi językami platformy .NET można tworzyć oprogramowanie w takich językach jak Java, C++, PHP czy Python. Windows Azure zapewnia integracją z popularnymi środowiskami programistycznymi jak Microsoft Visual Studio czy Eclipse.

W celu ułatwienia procesu wytwarzania oprogramowania po tę platformę, firma Microsoft udostępniła dedykowane dla różnych języków zestawy narządzi programistycznych. Ważną ich częścią jest emulator chmury, dzięki któremu można w wygodny sposób testować działąnie aplikacji, bez konieczności instalacji oprogramowania w chmurze.

## Android SDK ##
Android SDK jest paczką narzędzi programistycznych, niezbędnych w procesie tworzenia i testowania aplikacji na platformę Android. Ważnymi elementami Android SDK są wtyczki dla środowiska programistycznego Eclipse, symulator systemu.

## CoffeeScript ##
CoffeeScript jest językiem skryptowym kompilowalnym do kodu JavaScript. Główną zaletą tego języka jest wyeliminowanie nawiasów, klamr i średników, co zmniejsza ryzyko popełnienia składniowych błędów, uniemoż;iwiających poprawne działanie aplikacji internetowej.

## HTML5 i CSS3 ##
HTML5 jest językiem wykorzystywanym do tworzenia stron WWW. Jest rozwinięciem standardu języka HTML4, posiadając wiele udogodnień dla programistów. Główne technologie wersji 5 jest obsługa grafiki 2D/3D, audio i video oraz pełne wsparcie dla kaskadowych arkuszów styli w wersji 3 (CSS3). Dzięki temu, nie trzeba posiłkować się bibliotekami JavaScript oraz technologią Flash, by osiągnąć oczekiwane efekty wizualnei użytkowe aplikacji.


## Inne biblioteki wykorzystane w projekcie ##

### Entity Framework ###
Entity Framework jest biblioteką służącą do relacyjno-obiektowego mapowania w środowisku ADO.NET. Dzięki zastosowaniu tej biblioteki wraz z narzędziami będącymi integralną częścią języka C#, można w wygodny sposób zarządzać bazą danych bez konieczności używania języka SQL.

### AutoMapper ###
AutoMapper jest biblioteką służącą do mapaowania obiektów jednego typu na drugi. Pozwala to w szybki sposób odzielić warstwę aplikacji od warstwy biznesowej na poziomie modleu aplikacji.

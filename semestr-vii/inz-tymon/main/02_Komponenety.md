# Komponenty wykorzystane w projekcie

## Język Scala ##

Scala jest statycznie typowanym, hybrydowym językiem programowania łączącym paradygmaty programowania funkcyjnego oraz obiektowego stworzonym w celu sprostania wymaganiom pracy w środowisku rozproszonym. Główną platformą docelową języka jest Wirtualna Maszyna Javy (_ang. JVM - Java Virtual Machine_) ale trwają także prace nad kompilatorami pod platformę .NET oraz LLVM. Scala jest promowana jaka "następca Javy" - język który poprawia błędy projektowe Javy, jest bezpieczniejszy (więcej błędów wykrytych podczas kompilacji), posiada abstrakcje zastępujące standardowe programowanie wielowątkowe (a co za tym idzie problemy związane z ręczną obsługą wątków). Scala posiada też wiele funkcjonalności znanych z języków funkcyjnych takich jak Scheme, ML czy Haskell - anonimowe funkcje, algebraiczne struktury danych, inferencja typów, typy wyższego rzędu (_ang. higher-order kinds_), dopoasowanie do wzorca (_ang. pattern matching_), leniwa ewaluacja (_ang. lazy evaluation_). Ponadto Scala jest w pełni interoperacyjna z językiem Java co pozwala na łączenie kodu napisanego w obu tych językach w jednym projekcie.

Od paru lat Scala zdobywa coraz większą popularność zarówno w środowiskach akademickich/badawczych jak i w dużych korporacjach. Wiele firm używa Scali jako dodatek do istniejącego oprogramowania napisanego przy użyciu języka Java. 

Serwisy internetowe używające Scali to m.in. Twitter[^twitter] (przejście z Ruby na Scale), Foursquare[^foursquare] (od początku napisany w Scali), strona internetowa dziennika The Guardian[^guardian] (przejście z Javy na Scale), LinkedIn[^linkedin] (nowe funkcjonalności napisane przy użyciu Scali), Meetup[^meetup] (implementacja powiadomień w czasie rzeczywistym).

## Framework aplikacji internetowych Play! ##

Aplikacja ScalaJars oparta jest na frameworku aplikacji internetowych Play![^play] napisanym w zdecydowanej większości przy użyciu języka Scala. W celu lepszej adaptacji projektu wśród programistów i firm posiada też API do języka Java.

Play! jest oparty o lekka, bezstanową architekturę zaprojektowaną tak, aby maksymalnie wykorzystać dostępne zasoby i pozwolić na skalowanie aplikacji w miarę wzrostu liczby użytkowników. W odróżnieniu od standardowych bibliotek pozwalających na tworzenie aplikacji internetowych na platformie JVM, Play! implementuje architekturę MVC - Model, Widok, Kontroler. Głównymi założeniami tej architektury jest rozdzielenie logiki biznesowej, integracji z protokołem HTTP oraz warstwy prezentacji.

Play! jest udostępniony jako projekt OpenSource na licencji Apache 2.

## Baza danych Redis ##

Ze względu na specyfikę aplikacji znacznie różniącą się od typowych aplikacji bazodanowych jako magazyn danych został wykorzystany Redis[^redis].

Wspieranymi strukturami danych są:

* `String` - dowolny ciąg binarnych znaków, w odróżnieniu od najbardziej popularnej implementacji gdzie znak `\0` oznacza koniec ciągu Redis zapisuje osobno długość ciągu co pozwala na przechowywanie w bazie jakichkolwiek danych binarnych. Za pomocą komend bazy można m.in. odwołać się do dowolnego zakresu zachowanych danych. W przypadku gdy wartość ciągu reprezentuje liczbę możliwe są także operacje (de)inkrementacji czy operacje binarne.
* `List` - lista elementów typu `String`, baza pozwala m.in. na dodawanie/usuwanie elementów z obu stron listy oraz pobieranie określonego zakresu elementów.
* `Set` - zbiór unikalnych elementów typu `String`, baza udostępnia komendy pozwalające m.in. na dodawanie, usuwanie oraz pobieranie określonych elementów zbioru.
* `SortedSet` - podobnie jak w przypadku typu `Set` jest to zbiór unikalnych elementów typu `String` ale z dodatkową wartością numeryczną `score` określającą kolejność elementów w zbiorze. Dodatkowe operacje to m.in. pobranie elementów na podstawie parametru `score`.
* `Hash` - mapa o kluczach i wartościach typu `String` pozwalająca na wszystkie operację na typie `String` dla konkretnego pola mapy

Ponieważ typ `String` może zawierać dowolną wartość często jest wykorzystywany do przechowywania zserializowanych obiektów. W przypadku ScalaJars jako format serializacji został wybrany JSON. Jest to obecnie najbardziej popularny format danych używany w internecie. Zachowuje on czytelność zapisanych danych i jest wspierany przez praktycznie każdy język programowania.

Redis jest udostępniony jako projekt OpenSource na licencji BSD.

## Inne biblioteki wykorzystane w projekcie ##

### Scalaz ###

Scalaz[^scalaz] jest biblioteką napisaną w języku Scala rozszerzającą funkcyjne możliwości biblioteki standardowej bazującą częściowo na bibliotece standardowej języka Haskell.
Główne funkcjonalności biblioteki Scalaz wykorzystywane w projekcie to:

* operatory poprawiające czytelność kodu
* typy `Either` oraz `Validation` znacząco ułatwiające obsługę błędów i eliminujące konieczność korzystania z wyjątków
* monady i operacje z nimi związane (m.in. "Kleisli arrow")
* transformatory monad

Scalaz jest udostępnione jako projekt OpenSource na licencji BSD.


### scalaxb ###

scalaxb[^scalaxb] jest rozszerzeniem dla sbt generującym strukturę klas na podstawie pliku XSD. Wykorzystany został do wygenerowania reprezentacji struktury pliku POM standardu Maven.

scalaxb jest udostępnione jako projekt OpenSource na licencji MIT.


### Redis Client ###

Jako biblioteka do obsługi połączenia z bazą danych Redis został wykorzystany pakiet `net.debasishg.redisclient`[^redisclient]. Biblioteka ta implementuje wszystkie komendy bazy danych oraz pozwala na używanie natywnych typów języka Scala jako danych trzymanych w bazie. W celu ułatwienia pracy nad projektem w aplikacji ScalaJars zostało stworzone rozszerzenie tej biblioteki wspierające (de)serializację obiektów z/do formatu JSON przy pomocy klas typów.

Redis Client jest udostępniony jako projekt OpenSource.

### play-scalaz ###

play-scalaz[^play-scalaz] jest pomostem między frameworkiem Play! a biblioteką scalaz. Lista funkcjonalności zapewnionych przez bibliotekę:

* implementacje klas typów dla najczęściej używanych klas frameworka (m.in. `Promise`, `Future`)
* (de)serializacja obiektów za pomocą statycznie typowanych typeclass z obsługą błędów opartą o `Validation` 

play-scalaz jest udostępnione jako projekt OpenSource na licencji MIT.

### play-navigator ###

play-naviagtor[^play-navigator] jest alternatywną implementacją routera HTTP dla frameworka Play!. Oryginalny router posiada wiele ograniczeń, które uniemożliwiłyby powstanie aplikacji ScalaJars. Szczegółowe wyjaśnienie powodów powstania projektu znajduje się na blogu Codetunes[^codetunes].

play-naviagtor jest udostępniony jako projekt OpenSource na licencji MIT.


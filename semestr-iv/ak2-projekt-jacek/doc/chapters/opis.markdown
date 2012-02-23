# Opis formatu

Format jest zapisany w pamięci na 64 bitach. Bity `0-30` reprezentują w
licznik zapisany w kodzie NB, natomiast bity `32-62` reprezentują mianownik,
który również jest zapisany w kodzie NB. Bit `63` służy do określenia znaku
liczby. Jeśli bit ten jest ustawiony, oznacza to, że liczba jest ujemna. W
przeciwnym wypadku liczba jest dodatnia. Bit `31`to flaga utraty precyzji. Jest
ona ustawiana, jeśli podczas normalizacji liczby jej precyzja zostanie
drastycznie zmniejszona.

## Operacje arytmetyczne

Implementacja typu wspiera następujące działania arytmetyczne:

* dodawanie
* odejmowanie
* mnożenie
* dzielenie
* obliczenie odwrotności
* skrócenie ułamka

Konwersje:

* IEEE754 do rational
* rational do IEEE754

Wyniki cząstkowe operacji arytmetycznych, takie jak mnożenie liczników, są
zapisywane na 64 bitach, po czym liczba zostaje zaokrąglona w taki sposób, aby
wynik zmieścił się w zmiennej.

## Kody specjalne

Format uwzględnia dwa typy kodów specjalnych. Są to nie-liczby oraz
nieskończoności.

### Nie-liczby

Nie-liczba jest zapisywana w taki sposób, że bity części mianownika są
wyzerowane, ustawiona jest flaga utraty precyzji i wszystkie bity części
licznika są ustawione. Bit znaku może być ustawiony dowolnie.

### Nieskończoność

Nieskończoność jest zapisywana podobnie do nie-liczby, z tą różnicą, że licznik
może mieć dowolną wartość wartość poza `0x7FFFFFFF`. Bit znaku określa, czy
mamy do czynienia z $\infty$, czy z $-\infty$.


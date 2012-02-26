starter                                                               User Commands                                                               starter

NAZWA
       starter - skrypt uruchamiający wielokrotnie symulator m5 z parametrami zadanymi poprzez przedział watości.

INSTALACJA
       Skopiuj wszystkie pliki do folderu /m5/tests/test-progs/

URUCHOMIENIE 
       ./starter.sh [OPCJE] [-r ILOSC_PROGRAMOW] || [-p ILE_PROGRAMOW NAZWA_PROGRAMU_1 NAZWA_PROGRAMU_2 ...] ...  

WYNIKI
       Wynikem wykonania skryptu są pliki ze statystykami znajdujące się w folderze /m5/tests/test-progrs/wyniki/

OPIS
       Skrypt używa standardowych ustawień zapisanych w pliku starterconfig.txt do uruchomienia symulacji.
       Sugeruje się, aby używać pliku starterconfig.txt zamiast podawania parametrów w linii komend. Jest to rozwiązanie
       szybsze i bardziej intuicyjne. Zmiana parametrów poprzez podanie flag przy uruchomieniu programu jest również
       możliwa. Rozwiązanie to jest bardziej użyteczne dla niewielkiej ilości zadanych parametrów.

       Poza tym trzeba podać z linii komend flagę -r lub -p, aby wybrać programy do uruchomienia


       -a1
              zmien minimalny rozmiar assoc 1

       -a1max
              zmien maksymalny rozmiar assoc 1

       -a2
              zmien minimalny rozmiar assoc 2 

       -a2max
              zmien maksymalny rozmiar assoc 2

       -s1i
	          zmien minimalny rozmiar pamięci L1i

       -s1imax
	          zmien maksymalny rozmiar pamięci L1i

       -s1d
	          zmien minimalny rozmiar pamięci L1d

       -s1dmax
	          zmien maksymalny rozmiar pamięci L1d

       -s2
	          zmien minimalny rozmiar pamięci L2

       -s2max
	          zmien maksymalny rozmiar pamięci L2

       -c
	          zmien minimalna ilosc rdzeni

       -cmax
	          zmien maksymalna ilosc rdzeni

       -i
              zmien ilosc instrukcji do wykonania. Przy czym wykonanych zostaje 10^i instrukcji w czasie symulacji.

       -r [ILE]
              uruchom zadaną ilość losowych programów. Lista programów znajduje się w pliku programList.txt

       -p [ILE] [PROGRAM 1] [PROGRAM 2] [PROGRAM 3]
	          ilość uruchamianych programów i ich nazwy. Należy podać tyle programów ile wynosi liczba ILE podana
              bezpośrednio po fladze -p


PRZYKŁADY UŻYCIA
       ./starter.sh -p 2 art apsi
	      uruchamia dwa programy art i apsi wykorzystując ustawienia parametrów z pliku konfiguracyjnego
       ./starter.sh -a1 2 -a1max 8 -r 3 
          uruchamia symulacje z 3 losowymi programami dla assoc 1 równego 2,4,8



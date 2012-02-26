function v = wariancja(x,N,Skip,Len)
% WARIANCJA oblicza wariancje wybranego fragmentu sygnalu
%
%	v = WARIANCJA(x,N,Skip,Len)
%
% Wejscie:
% 	x 	- sygnal
% 	N 	- dlugosc sygnalu w probkach
% 	Skip 	- poczatek okna
% 	Len 	- dlugosc okna
%
% Wyjscie:
% 	v		- wariancja wybranego fragmentu sygnalu
%

% Laboratorium - Podstawy i algorytmy przetwarzania sygnalow
% marzec 2005
%

if (Skip+Len > N)
  error("Skip+Len wieksze niz dlugosc sygnalu")
endif

% --------------------------------------------------------------
%	wartosc srednia
% --------------------------------------------------------------
m = 0;
for k = 1:N           
  m = m + x(k);
endfor
m = m / N;

% --------------------------------------------------------------
%	wariancja
% --------------------------------------------------------------
v = 0;
for k = 1:Len            
  v = v + (x(k+Skip)-m)^2;
endfor
v = v / Len;

# disp(["wariancja wynosi ", num2str(v)])


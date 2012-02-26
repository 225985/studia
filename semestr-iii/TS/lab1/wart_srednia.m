function m = wart_srednia(x,N,Skip,Len)
%WART_SREDNIA oblicza wartosc srednia z wybranego fragmentu sygnalu
%
%	m = WART_SREDNIA(x,N,Skip,Len)
%
% Wejscie:
% 	x 		- sygnal
% 	N 		- dlugosc sygnalu w probkach
% 	Skip 	- poczatek okna
% 	Len 	- dlugosc okna
%
% Wyjscie:
% 	m		- wartosc srednia
%

% Laboratorium - Podstawy i algorytmy przetwarzania sygnalow
% marzec 2005
% 

if (Skip+Len > N)
  error("Skip+Len wieksze niz dlugosc sygnalu")
endif

m = 0;
for k = 1:Len            
  m = m+x(k+Skip);
endfor

m = m / Len;

# disp(["      wartosc srednia wynosi ",num2str(m)])


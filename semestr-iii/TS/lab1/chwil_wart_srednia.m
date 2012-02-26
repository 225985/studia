function [m] = chwil_wart_srednia(x,N,Len)
% CHWIL_WART_SREDNIA  oblicza chwilowa wartosc srednia
%
%	[m] = CHWIL_WART_SREDNIA(x,N,Len)
%
% Wejscie:
% 	x 	- sygnal
% 	N 	- dlugosc sygnalu w probkach
%	Len - dlugosc okna w probkach
%
% Wyjscie:
% 	m	- chwilowa wartosc srednia 
%

% Laboratorium - Podstawy i algorytmy przetwarzania sygnalow
% marzec 2005
% 

if (Len > N)
  error("Len wieksze niz dlugosc sygnalu")
endif

% --------------------------------------------------------------
% 	Dla poczatku sygnalu
% --------------------------------------------------------------
for i = 1:Len-1
  a = 0;
  for k = 1:i-1
    a = a + x(k);
  endfor;
  m(i) = a / i;
endfor;

% --------------------------------------------------------------
% 	Reszta sygnalu
% --------------------------------------------------------------
for i = Len:N
  a = 0;
  for k = i-Len+1:i            
    a = a + x(k);
  endfor
  m(i) = a / Len;
endfor;


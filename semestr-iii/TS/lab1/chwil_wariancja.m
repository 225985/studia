function [v] = chwil_wariancja (x, N, Len)
%CHWIL_WARIANCJA oblicza chwilowa wariancje
%
%	[v] = CHWIL_WARIANCJA (x, N, Len)
%
% Wejscie:
% 	x 	- sygnal
% 	N 	- dlugosc sygnalu w probkach
% 	Len - dlugosc okna w probkach 
%
% Wyjscie:
% 	v	- chwilowa wariancja
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
% --------------------------------------------------------------
% 	Wart.srednia
% --------------------------------------------------------------
  m = 0;
  for k = 1:i-1            
    m = m + x(k);
  endfor
  m = m / i;
% --------------------------------------------------------------
% 	Wariancja
% --------------------------------------------------------------
  a = 0;
  for k = 1:i-1
    a = a + (x(k)-m)^2;
  endfor;
  v(i) = a / i;
endfor;

% --------------------------------------------------------------
% 	Reszta sygnalu
% --------------------------------------------------------------
for i = Len:N
% --------------------------------------------------------------
% 	Wart.srednia
% --------------------------------------------------------------
  m = 0;
  for k = i-Len+1:i            
    m = m + x(k);
  endfor
  m = m / Len;
% --------------------------------------------------------------
% 	Wariancja
% --------------------------------------------------------------
  a = 0;
  for k = i-Len+1:i            
    a = a + (x(k)-m)^2;
  endfor
  v(i) = a / Len;
endfor;

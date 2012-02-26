function [v] = biez_wariancja (x, N, alfa)
%BIEZ_WARIANCJA oblicza biezaca wariancje sygnalu
%
%	[v] = BIEZ_WARIANCJA (x, N, alfa)
%
% Wejscie:
%	x	 	- sygnal
% 	N 		- dlugosc sygnalu w probkach
% 	alfa 	- stala adaptacji (0.0 < alfa < 1.0)
%
% Wyjscie:
%	v		- biezaca wariancja
%

% Laboratorium - Podstawy i algorytmy przetwarzania sygnalow
% marzec 2005
% 

if (alfa < 0.0 || alfa > 1.0)
  error("Niedopuszczalna wartosc alfa")
endif

% --------------------------------------------------------------
% 	Adaptacja
% --------------------------------------------------------------
m = x(1);
v(1) = (x(1)-m)^2;
for i = 2:N
  m = alfa * m + (1-alfa) * x(i);
  v(i) = alfa * v(i-1) + (1-alfa) * (x(i)-m)^2;
endfor;

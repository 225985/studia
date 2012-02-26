function [m] = biez_wart_srednia (x, N, alfa)
%BIEZ_WART_SREDNIA oblicza biezaca wartosc srednia
%
%	[m] = BIEZ_WART_SREDNIA (x, N, alfa)
%
% Wejscie:
% 	x		- sygnal
% 	N		- d³ugoœæ sygnalu w próbkach
% 	alfa	- sta³a adaptacji (0.0 < alfa < 1.0)
%
% Wyjscie:
% 	m		- biezaca wartosc srednia
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
m(1) = x(1);
for i = 2:N
  m(i) = alfa * m(i-1) + (1-alfa) * x(i);
endfor;

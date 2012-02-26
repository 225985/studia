function [f,res] = fftg(x,fp)

% FFTG kresli wykres modulu widma sygnalu
%
%   [X] = fftg(x,fp)
% x  - sygnal, ktorego widmo ma zostac wykreslone
% fp - czestotliwosc z ktora sygnal zostal sprobkowany
% X  - FFT sygnalu
%
% Podstawy i algorytmy przetwarzania sygnalow
% semestr letni 2005
%




X = fft(x);
N = length(x);

dt = 1/fp;
df = 1 /(N*dt);

%   bez przesuwania
%f = df*(0 : N-1);
%plot(f,abs(X),'r-');
%semilogx(f,abs(X),'r-');

%   z przesuwaniem
f = ((1:N) - ceil(N/2)) /N/dt;
res = fftshift(abs(X));
% semilogy(f,res,'r-');
%semilogx(f,fftshift(abs(X)),'r-');

%  legend('off')
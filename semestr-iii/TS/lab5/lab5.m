% Laboratorium nr 5

setenv GNUTERM 'x11'

% 1. Wplyw rzedu na charakterystyke

figure(1);
h = fir1(1, 0.5);
freqz(h, 1);
print(["out/fig1.png"], "-dpng", "-landscape");


figure(2);
h = fir1(10, 0.5);
freqz(h, 1);
print(["out/fig2.png"], "-dpng", "-landscape");

figure(3);
h = fir1(20, 0.5);
freqz(h, 1);
print(["out/fig3.png"], "-dpng", "-landscape");

figure(4);
h = fir1(30, 0.5);
freqz(h, 1);
print(["out/fig4.png"], "-dpng", "-landscape");

% 2. Wplyw okna
N = 18

figure(5);
h = fir1(N, 0.5, hanning(N+1));
freqz(h, 1);
print(["out/fig5.png"], "-dpng", "-landscape");

figure(6);
h = fir1(N, 0.5, hamming(N+1));
freqz(h, 1);
print(["out/fig6.png"], "-dpng", "-landscape");

figure(7);
h = fir1(N, 0.5, gausswin(N+1));
freqz(h, 1);
print(["out/fig7.png"], "-dpng", "-landscape");

figure(8);
h = fir1(N, 0.5, bartlett(N+1));
freqz(h, 1);
print(["out/fig8.png"], "-dpng", "-landscape");

figure(9);
h = fir1(N, 0.5, kaiser(N+1, 0.5));
freqz(h, 1);
print(["out/fig9.png"], "-dpng", "-landscape");

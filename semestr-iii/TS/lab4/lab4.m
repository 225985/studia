% Laboratorium nr 4

setenv GNUTERM 'x11'

% 1. Sygnal sinus, widmo
figure(1)
function [] = pkt1(i, T)
    F = 10;
    A = 1;
    Fpr = 500;
    
    [t,y] = sinus(A, F, Fpr, 0, T);
    subplot(2,2,i*2-1)
    plot(t,y)
    title(["Sygnal sinus, f = ", num2str(F), ", T = ", num2str(T)])

    [f,res] = fftg(y, Fpr);
    subplot(2,2,i*2)
    semilogy(f,res,'r-');
    title(["Widmo sygnalu sinus, f = ", num2str(F), ", T = ", num2str(T)])
end;

pkt1(1, 1)
pkt1(2, 1.76)

print(["out/fig1.png"], "-dpng", "-landscape");


% 2. DFT
figure(2)
function [] = pkt2(i, F)
    A = 1;
    T = 2;
    Fpr = 256;
    
    [t,y] = sinus(1, F, Fpr, 0, T);
    subplot(2,2,i*2-1)
    plot(t,y)
    title(["Sygnal sinus, f = ", num2str(F), ", T = ", num2str(T)])

    [f,res] = fftg(y, Fpr);
    subplot(2,2,i*2)
    semilogy(f,res,'r-');
    title(["Widmo sygnalu sinus, f = ", num2str(F), ", T = ", num2str(T)])
end;

pkt2(1, 4)
pkt2(2, 4.33)

print(["out/fig2.png"], "-dpng", "-landscape");


% 3. Transformata Fouriera - sygnal sinus i prostokat
function [] = pkt3(y)
    X = fft(y);

    subplot(2,2,1)
    plot(real(X), 'b-');
    title("Czesc rzeczywista")

    subplot(2,2,2)
    plot(imag(X), 'b-')
    title("Czesc urojona")

    subplot(2,2,3)
    plot(abs(X), 'b-')
    title("Modul")

    subplot(2,2,4)
    Xf = angle(X);
    Xff = unwrap(Xf);
    plot(Xff, 'b-')
    title("Faza")
end;

fpr=512; 
f = 5;
n=0:1/fpr:1; 
y=sin(2*pi*f*n);

figure(3);
pkt3(y);
print(["out/fig3.png"], "-dpng", "-landscape");

y = prostokat(1,f,fpr,0,1,0.5);

figure(4)
pkt3(y)
print(["out/fig4.png"], "-dpng", "-landscape");


% 4. Wykresy fazowe sinus cosinus
figure(5)
fpr=512; 
f = 10;
n=0:1/fpr:1;

x=sin(2*pi*f*n); 
X=fft(x); 
Xf=angle(X);
Xff=unwrap(Xf);

subplot(2,2,1); 
plot(n, x);
title("Sygnal sinus");

subplot(2,2,2); 
plot(Xff, 'r-');
title("Wykres fazowy sinus");

x=cos(2*pi*f*n); 
X=fft(x); 
Xf=angle(X);
Xff=unwrap(Xf);

subplot(2,2,3); 
plot(n, x);
title("Sygnal cosinus");

subplot(2,2,4); 
plot(Xff, 'r-');
title("Wykres fazowy cosinus");
print(["out/fig5.png"], "-dpng", "-landscape");


% 5. Sygnal zespolony
N=512;
fpr=512; 
f = 50;
n=0:1/fpr:1;

xr = sin(2*pi*f*n);
xi = cos(2*pi*f*n);
xc = complex(xr, xi);
 
figure(6);
plot(n(1:100), xr(1:100), ";czesc rzeczywista;r-", n(1:100), xi(1:100), ";czesc urojona;b-")
print(["out/fig6.png"], "-dpng", "-landscape");

figure(7)
pkt3(xc)
print(["out/fig7.png"], "-dpng", "-landscape");

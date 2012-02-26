setenv GNUTERM 'x11'

# Stale
F = 4;
Fpr = 200;
T = 2;
A = 1;
N = T*Fpr;
taumax = 0.4*N;
 
# cosinus = sinus(faza = 90)

# Punkt 1 - Autokorelacja
figure(1);

# a) sinus
[t,y] = sinus(A, F, Fpr, 0, T);
subplot(2,2,1)
plot(t,y);
title("sinus");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,2)
plot(b,a);
title("Autokorelacja sinus");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

# b) cosinus
[t,y] = sinus(A, F, Fpr, 90, T);
subplot(2,2,3)
plot(t,y);
title("cosinus");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,4)
plot(b,a);
title("Autokorelacja cosinus");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

print(["out/Figure1.png"], "-dpng", "-landscape")


figure(2)

# d) szum bialy
y = randn(1, N);
subplot(2,2,1)
plot(y);
title("Szum bialy")
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,2)
plot(b,a);
title("Autokorelacja szum bialy")
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");


# c) prostokat
# 0.1
[t,y] = prostokat(A, F, Fpr, 0, T, 0.1);
subplot(2,2,3)
plot(t,y);
title("Prostokat wyp = 0.1")
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,4)
plot(b,a);
title("Autokorelacja prostokat wyp = 0.1");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

print(["out/Figure2.png"], "-dpng", "-landscape")

figure(3);

# 0.5
[t,y] = prostokat(A, F, Fpr, 0, T, 0.5);
subplot(2,2,1)
plot(t,y);
title("Prostokat wyp = 0.5")
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,2)
plot(b,a);
title("Autokorelacja prostokat wyp = 0.5");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

# 0.9
[t,y] = prostokat(A, F, Fpr, 0, T, 0.9);
subplot(2,2,3)
plot(t,y);
title("Prostokat wyp = 0.9")
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, taumax);
subplot(2,2,4)
plot(b,a);
title("Autokorelacja prostokat wyp = 0.9");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

print(["out/Figure3.png"], "-dpng", "-landscape")




# Punkt 2 - Korelacja wzajemna
figure(4)
# a) x=sin, y=cos
[t,x] = sinus(A, F, Fpr, 0, T);
[t,y] = sinus(A, F, Fpr, 90, T);
subplot(2,2,1)
plot(t,x,t,y)
title("sin, cos");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(x, y, taumax);
subplot(2,2,2)
plot(b,a);
title("Korelacja wzajemna sin, cos");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

# b) x=cos, y=sin
[t,x] = sinus(A, F, Fpr, 0, T);
[t,y] = sinus(A, F, Fpr, 90, T);
subplot(2,2,3)
plot(t,y,t,x)
title("cos, sin");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(y, x, taumax);
subplot(2,2,4)
plot(b,a);
title("Korelacja wzajemna cos, sin");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

print(["out/Figure4.png"], "-dpng", "-landscape")


figure(5)
# c) x=sin, y=prostokat
[t,x] = sinus(A, F, Fpr, 0, T);
[t,y] = prostokat(A, F, Fpr, 0, T, 0.5);
subplot(2,2,1)
plot(t,x,t,y)
title("sin, prostokat");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(x, y, taumax);
subplot(2,2,2)
plot(b,a);
title("Korelacja wzajemna x=sin, y=prostokat");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");
 

# d) x=sin, y=szum
[t,x] = sinus(A, F, Fpr, 0, T);
y = randn(1, N);
subplot(2,2,3)
plot(t,x,t,y)
title("sin, szum");
xlabel("czas");
ylabel("wartosc sygnalu");

[a,b] = xcorr(x, y, taumax);
subplot(2,2,4)
plot(b,a);
title("Korelacja wzajemna x=sin, y=szum");
xlabel("Przesunecie");
ylabel("Wartosc funkcji korelacji");

print(["out/Figure5.png"], "-dpng", "-landscape")

# setenv GNUTERM 'x11'
f = 2;
fpr = 100;
N = f * fpr;
FAZY=0:10:100;
WYPS=0:0.1:1;
figc = 0;
# Wykorzystane sygnaly

[tp, yp] = prostokat(10, f, fpr, 0, 2, 0.5);
[tt, yt] = trojkat(10, f, fpr, 0, 2, 0.5);

figure(figc+=1);
subplot(2,1,1);
plot(tp,yp);
title("Sygnal prostokatny");
xlabel("czas")
ylabel("wartosc sygnalu")
subplot(2,1,2);
plot(tt,yt);
title("Sygnal trojkatny");
xlabel("czas")
ylabel("wartosc sygnalu")
print(["out/Figure", num2str(figc), ".png"], "-dpng", "-landscape")



disp("Punkt 1. Wartosc srednia")
disp("  1.1 Sygnal prostokatny")
figure(figc+=1);

disp("    a) Wplyw zmiany fazy:")
s = zeros(size(FAZY));
i=0;
for faza=FAZY
  [t, y] = prostokat(10, f, fpr, faza, 2, 0.5);
  s(i+=1) = wart_srednia(y, N, 0, N);
end;
s
subplot(2,2,1); 
plot(FAZY, s);
xlabel("faza")
ylabel("wartosc srednia")
title("Sygnal prostokatny. Wartosc srednia w zaleznosc od zmiany fazy");

disp("")
disp("    b) Wplyw zmiany wypelnienia:")
s = zeros(size(WYPS));
i=0;
for wyp=WYPS
  [t, y] = prostokat(10, f, fpr, 0, 2, wyp);
  s(i+=1) = wart_srednia(y, N, 0, N);
end;
s
subplot(2,2,2); 
plot(WYPS, s);
xlabel("wypelnienie")
ylabel("wartosc srednia")
title("Sygnal prostokatny. Wartosc srednia w zaleznosc od zmiany wypelnienia");


disp("")
disp("")
disp("  1.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany fazy:")
s = zeros(size(FAZY));
i=0;
for faza=FAZY
  [t, y] = trojkat(10, f, fpr, 50, 2, 0.5);
  s(i+=1) = wart_srednia(y, N, 0, N);
end;
s
subplot(2,2,3); 
plot(FAZY, s);
xlabel("faza")
ylabel("wartosc srednia")
title("Sygnal trojkatny. Wartosc srednia w zaleznosc od zmiany fazy");

disp("")
disp("    b) Wplyw zmiany wypelnienia:")
s = zeros(size(WYPS));
i=0;
for wyp=WYPS
  [t, y] = trojkat(10, f, fpr, 50, 2, 0.5);
  s(i+=1) = wart_srednia(y, N, 0, N);
end;
s
subplot(2,2,4); 
plot(WYPS, s);
xlabel("wypelnienie")
ylabel("wartosc srednia")
title("Sygnal trojkatny. Wartosc srednia w zaleznosc od zmiany wypelnienia");

print(["out/Figure", num2str(figc), ".png"], "-dpng")



disp("Punkt 2. Chwilowa wartosc srednia")
disp("  2.1 Sygnal prostokatny")
disp("    a) Wplyw zmiany dlugosc 'okna' k:")
figure(figc+=1);
i=1;
for k=1:N/10:N
  s = chwil_wart_srednia(yp, N, k);
  subplot(5, 2, i); 
  plot(s);
  title(["k=", num2str(k)])
  i+=1;
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")

disp("  2.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany dlugosc 'okna' k:")
figure(figc+=1);
i=1;
for k=1:N/10:N
  s = chwil_wart_srednia(yt, N, k);
  subplot(5, 2, i); 
  plot(s);
  title(["k=", num2str(k)])
  i+=1;
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")



disp("Punkt 3. Biezaca wartosc srednia")
disp("  3.1 Sygnal prostokatny")
disp("    a) Wplyw zmiany alfa:")
figure(figc+=1);
A = [0.1, 0.3, 0.5, 0.7, 0.9, 0.92, 0.95, 0.99, 0.999, 1.0];
for i=1:length(A)
  s = biez_wart_srednia(yp, N, A(i));
  subplot(5, 2, i); 
  plot(s);
  title(["a=", num2str(A(i))])
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")

disp("  3.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany alfa:")
figure(figc+=1);
i=1;
for i=1:length(A)
  s = biez_wart_srednia(yt, N, A(i));
  subplot(5, 2, i); 
  plot(s);
  title(["a=", num2str(A(i))])
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")



disp("Punkt 4. Wariancja")
disp("  4.1 Sygnal prostokatny")
disp("    a) Wplyw zmiany fazy:")
figure(figc+=1);
s = zeros(size(FAZY));
i=0;
for faza=FAZY
  [t, y] = prostokat(10, f, fpr, faza, 2, 0.5);
  s(i+=1) = wariancja(y, N, 0, N);
end;
s
subplot(2,2,1); 
plot(FAZY, s);
xlabel("faza")
ylabel("wariancja")
title("Sygnal prostokatny. Wariancja w zaleznosc od zmiany fazy");

disp("")
disp("    b) Wplyw zmiany wypelnienia:")
s = zeros(size(WYPS));
i=0;
for wyp=WYPS
  [t, y] = prostokat(10, f, fpr, 0, 2, wyp);
  s(i+=1) = wariancja(y, N, 0, N);
end;
s
subplot(2,2,2); 
plot(WYPS, s);
xlabel("wypelnienie")
ylabel("wariancja")
title("Sygnal prostokatny. Wariancja w zaleznosc od zmiany wypelnienia");

disp("")
disp("")
disp("  4.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany fazy:")
s = zeros(size(FAZY));
i=0;
for faza=FAZY
  [t, y] = trojkat(10, f, fpr, 50, 2, 0.5);
   s(i+=1) = wariancja(y, N, 0, N);
end;
s
subplot(2,2,3); 
plot(FAZY, s);
xlabel("faza")
ylabel("wariancja")
title("Sygnal trojkatny. Wariancja w zaleznosc od zmiany fazy");

disp("")
disp("    b) Wplyw zmiany wypelnienia:")
s = zeros(size(WYPS));
i=0;
for wyp=WYPS
  [t, y] = trojkat(10, f, fpr, 50, 2, 0.5);
  s(i+=1) = wariancja(y, N, 0, N);
end;
s
subplot(2,2,4); 
plot(WYPS, s);
xlabel("wypelnienie")
ylabel("wariancja")
title("Sygnal trojkatny. Wariancja w zaleznosc od zmiany wypelnienia");

print(["out/Figure", num2str(figc), ".png"], "-dpng")


disp("Punkt 5. Chwilowa wariancja")
disp("  5.1 Sygnal prostokatny")
disp("    a) Wplyw zmiany dlugosc 'okna' k:")
figure(figc+=1);
i=1;
for k=1:N/10:N
  s = chwil_wariancja(yp, N, k);
  subplot(5, 2, i); 
  plot(s);
  title(["k=", num2str(k)])
  i+=1;
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")

disp("  5.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany dlugosc 'okna' k:")
figure(figc+=1);
i=1;
for k=1:N/10:N
  s = chwil_wariancja(yt, N, k);
  subplot(5, 2, i); 
  plot(s);
  title(["k=", num2str(k)])
  i+=1;
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")



disp("Punkt 6. Biezaca wariancja")
disp("  6.1 Sygnal prostokatny")
disp("    a) Wplyw zmiany alfa:")
figure(figc+=1);
A = [0.1, 0.3, 0.5, 0.7, 0.9, 0.92, 0.95, 0.99, 0.999, 1.0];
for i=1:length(A)
  s = biez_wariancja(yp, N, A(i));
  subplot(5, 2, i); 
  plot(s);
  title(["a=", num2str(A(i))])
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")

disp("  6.2 Sygnal trojkatny")
disp("    a) Wplyw zmiany alfa:")
figure(figc+=1);
i=1;
for i=1:length(A)
  s = biez_wariancja(yt, N, A(i));
  subplot(5, 2, i); 
  plot(s);
  title(["a=", num2str(A(i))])
end;
print(["out/Figure", num2str(figc), ".png"], "-dpng")

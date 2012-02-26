% Laboratorium nr 3

% 1. Probkowanie

setenv GNUTERM 'x11'
F = 1000;
T = 1;
A = 1;

zak = 300;
baseFpr = 10000;

function [] = probkowanie(F, T, A, fpr, base, zak, j)
	figure(j);
	[t,y] = sinus(A, F, fpr, 0, T);
	
	subplot(3,1,1);
	if (fpr == base)
		plot(t(1:1000), y(1:1000))
	else
		plot(t, y);
	endif
	title(["fpr = ", num2str(fpr), " calosc"]);
	xlabel("czas")
	ylabel("wartosc")
	
	subplot(3,1,2);
	plot(t(1:fpr/base*zak), y(1:fpr/base*zak));
	title(["fpr = ", num2str(fpr), " fragment"]);
	xlabel("czas")
	ylabel("wartosc")	
	
	subplot(3,1,3);
	[f,res] = fftg(y, fpr);
	semilogy(f,res,'r-');
	title(["fpr = ", num2str(fpr), " widmo"]);
	xlabel("f")
	print(["out/prob", num2str(j), ".png"], "-dpng", "-landscape");
end

probkowanie(F, T, A, 10000, baseFpr, zak, 1);
probkowanie(F, T, A, 2*F, baseFpr, zak, 2);
probkowanie(F, T, A, 490, baseFpr, zak, 3);

% 2. Kwantowanie

function [] = kwantowanie(t,y,j)
	zak = 100;
	N = [1, 2, 4, 10];
	for i=1:length(N)
		fig = (j-4)*4+3+i;
		figure(fig);
		subplot(2, 1, 1);
		a = 2^N(i)-1;
		sq = round(y*a)/a;
		b = y-sq;
		plot(t(1:zak),y(1:zak),'-b;sygnal oryginalny;',t(1:zak),sq(1:zak),'-g;sygnal sprobkowany;',t(1:zak),b(1:zak),'-r;blad probkowania;');
		title(["n = ", num2str(N(i))]);
		xlabel("czas")
		ylabel("wartosc")
		
		subplot(2, 1, 2);
		[f,ffty] = fftg(y, 500);
		[f,fftsq] = fftg(sq, 500);
		semilogy(f,ffty,'-b;sygnal oryginalny;',f,fftsq,'-g;sygnal sprobkowany;');
		title(["n = ", num2str(N(i)), " widmo"]);
		xlabel("f")
		
		print(["out/kwant", num2str(j-3), "-", num2str(N(i)) ".png"], "-dpng", "-landscape");
	end
end

F = 10
fpr = 500
[t,y] = sinus(A, F, fpr, 0, T);
kwantowanie(t,y, 4);
[t,y] = prostokat(A, F, fpr, 0, T, 0.5);
kwantowanie(t,y, 5);
[t,y] = trojkat(A, F, fpr, 0, T, 0.5);
kwantowanie(t,y, 6);














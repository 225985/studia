%
% KW demonstruje kwantowanie sygnalu
%
% Podstawy i algorytmy przetwarzania sygnalow
% semestr letni 2005
%
setenv GNUTERM 'x11'
A=1; T=1;
t=0:.001:T; 

% funkcja liniowa
% s=(A/T)*t;
% funkcja kwadratowa
% s=t.^2;
% sinus
s=0.5+0.5*sin(2*pi*t);
% szum o rozkladzie jednostajnym
% s=rand(1,1001);
% szum o rozkladzie normalnym
%s=randn(1,1001); s=s/max(abs(s)); s=(s/2)+0.5; 
% subplot(111); clg; 

% N = [1,5,10];

for n=1:10;
	% n=N(i);
    a=2^n-1;
    sq=round(s*a)/a;
    b=s-sq;
    plot(t,s,'-b;sygnal oryginalny;',t,sq,'-g;sygnal sprobkowany;',t,b,'-r;blad probkowania;'); grid on
    xlabel('czas t'); ylabel('Amplituda A');
    title(['Kwantowanie sygnalu', num2str(n)]);
    sb(n,:)=20*log10(std(s)/std(b));
    pause
end

pause

clf; 

plot(sb,'r*;wartosci SNR;'); hold on; 
plot(sb,'b-;;'); grid on; 
hold off;
title('Zaleznosc SNR od liczby bitow przetwornika');
xlabel('Wartosc SNR [db]]');
ylabel('liczba bitow przetwornika [bit]');
n=[6 7 8 9 10];
% wyznaczenie wspolczynnikow regresji

polyfit(n',sb(6:10,:),1)

pause

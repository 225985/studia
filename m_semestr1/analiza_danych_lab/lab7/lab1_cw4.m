function lab1_cw4
%Wygeneruj ci�g liczb za pomoc� wbudowanego generatora randn oraz 3
%poni�szych generator�w oraz narysuj histogramy rozk�adu prawdopodobie�stwa dla nich.
%Oblicz �rednie i wariancje oraz por�wnaj je z za�o�onymi parametrami.
x0=randn(500,1);
min0 = min(min(x0));
x0 = x0 - min0;
max0 = max(max(x0));
x0 = x0 / max0;
x1=gen1(1,500);
x2=gen2(1,500);
x3=gen3(1,500);
subplot(411)
hist(x0)
subplot(412)
hist(x1)
subplot(413)
hist(x2)
subplot(414)
hist(x3)
end
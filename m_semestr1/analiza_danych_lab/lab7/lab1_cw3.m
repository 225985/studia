function lab1_cw3
%Wylosuj prbk 300 elementow z rozkadu normalnego. Narysuj j funkcj
%plot. Przygotuj histogram zoony 20 prostoktw. Ponownie narysuj histogram zoony z
%100 prostoktw. Porwnaj wyniki. Narysuj boxplota dla tych danych.
x=randn(100,1);
subplot(411)
plot(x)
subplot(412)
hist(x,20)
subplot(413)
hist(x,100)
subplot(414)
boxplot(x)
end

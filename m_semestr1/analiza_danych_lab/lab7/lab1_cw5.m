function lab1_cw5 
dane = fopen('iris.txt', 'rt');
fgetl(dane);
C = textscan(dane, '%s %f %f %f %f', 'delimiter', ' ', 'MultipleDelimsAsOne', 1);
hist(C{2},20)
end
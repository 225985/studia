function [m, s, med] = lab1_cw8
data = [8.5; 7.6; 9.3; 5.5; 11.4; 6.9; 6.5; 12.9; 8.7; 4.8; 4.2; 8.1; 6.5; 5.8; 6.7; 2.4; 11.1; 7.1; 8.8; 7.2];
subplot(211)
boxplot(data);
subplot(212);
hist(data);
[m, s] = stat(data);
med = median(data);
end
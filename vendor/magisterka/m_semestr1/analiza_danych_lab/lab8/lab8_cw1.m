function [H,P] = lab2_cw1
%H1 - sredni czas rozny od 28
r = 31.5 + 5.*randn(100,1);
[H,P] = ttest(r,28,0.05,'both');
end
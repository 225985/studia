function [H,P] = lab2_cw3_ttest
%H1 - srednie ceny wsrosly mniej niz 49%
r = 38 + 14.*randn(18,1);
[H,P] = ttest(r,49,0.01,'left');
end
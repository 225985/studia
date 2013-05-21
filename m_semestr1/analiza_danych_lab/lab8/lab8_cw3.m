function [H,P,H2,P2] = lab2_cw3
%H1 - srednie ceny wsrosly mniej niz 49%
r = 38 + 14.*randn(18,1);
[H,P] = ttest(r,49,0.01,'left');

t = (mean(r)-49)/std(r)*sqrt(17);
P2 = tcdf(t,17);
H2 = 0;
if (P2 <= 0.01)
    H2 = 1;
end
end
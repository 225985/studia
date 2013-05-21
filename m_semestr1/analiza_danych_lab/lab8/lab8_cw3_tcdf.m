function [H,P] = lab2_cw3_tcdf
%H1 - srednie ceny wsrosly mniej niz 49%
r = 38 + 14.*randn(18,1);
t = (mean(r)-49)/std(r)*sqrt(17);
P = tcdf(t,17);
H = 0;
if (P <= 0.01)
    H = 1;
end
end
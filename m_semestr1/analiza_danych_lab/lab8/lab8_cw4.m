function [H, P, H2, P2] = lab2_cw4
%H1 - wariancja jest mniejsza niz 1,6
r = 38 + 1.5.*randn(25,1);
[H,P] = vartest(r,1.6,0.05,'left');
[H2,P2] = vartest(r,1.6,0.1,'left');
end
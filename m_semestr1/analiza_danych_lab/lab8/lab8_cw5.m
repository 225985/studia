function [H,P] = lab2_cw5
%H1 - wariancja starych jest wiêksza od m³odych
new = 27.7 + 5.5.*randn(20,1);
old = 32.1 + 6.3.*randn(22,1);
[H,P] = vartest2(new,old,0.05,'left');
end
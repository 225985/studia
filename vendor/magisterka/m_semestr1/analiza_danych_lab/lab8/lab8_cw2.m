function [H, P] = lab2_cw2
%H1 - czas doreczenia > 3dni
r = [1;1;1;2;2;2;2;3;3;3;4;4;4;4;4;5;5;6;6;6;7;7];
t = (mean(r)-3)/std(r)*sqrt(21);
P = tcdf(t,21);
P = 1 - P;
H = 0;
if (P <= 0.05)
    H = 1;
end
end
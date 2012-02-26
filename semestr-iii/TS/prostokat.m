function [n,y] = prostokat(A, f, fpr, faza, T,w)
n = zeros(1, T*fpr);
y = n;
k = 1;
 
for i=1:1/fpr:T
   n(k)=i;
   y(k)=floor(i);
   # y(k) = i;
   k+=1;
end;
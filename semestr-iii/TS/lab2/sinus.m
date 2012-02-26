function [t,y] = sinus(A, f, fpr, faza, T)
  t = zeros(1, T*fpr);
  y = t;
  k = 1;
  
  fazarad = faza*pi/180;
  
  for i=1:1:length(t)
    t(k)=i/fpr;
    y(k)=A*sin(2*pi*i/fpr*f + fazarad);
    k=k+1;
  end;

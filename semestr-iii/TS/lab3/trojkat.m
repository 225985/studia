function [t,y]=trojkat(A,f,fpr,faza,T,w)

przesuniecie=round(faza/360*fpr/f);
t=zeros(1,(T*fpr+przesuniecie));
y=t;
#size(t)
k=2;
aa=round(w*fpr/f);
aaa=round((1-w)*fpr/f);
a1=0;
a2=1;
for i=1:1:length(t)
    t(k)=i/fpr;
    if a1<=aa
	#y(k)=y(k-1)+A*f/fpr/w;
        y(k)=A*a1/aa;
        a1=a1+1;
    end;
    if a1>aa && a2<=aaa
       #y(k)=y(k-1)-A*f/fpr/(1-w);
       y(k)=A*(1-a2/aaa);
       a2=a2+1;
    end;
    k=k+1;
    if a1>aa && a2>aaa
      a1=0;
      a2=1;
    end;    
end;
y=y(1+przesuniecie:length(y));
t=t(1:length(y));

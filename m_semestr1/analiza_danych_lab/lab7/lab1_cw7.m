function p = lab1_cw7
r = randn(100,1);
count = 0;
for i=1:100,
   if (abs(r(i))<2)
      count = count + 1; 
   end
end
p = count / 100.0;
end
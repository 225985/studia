[num, txt, raw] = xlsread('E:\181043L1_2.xls',1,'E2:E1582')
subplot(311)
boxplot(num,1)
subplot(312)
hist(num)
bigger = num > 350
A = sum(bigger)
prob = A/length(num)
[mean,stdev] = stat(num)
r = mean + stdev * randn(100, 1)
subplot(313)
hist(r)


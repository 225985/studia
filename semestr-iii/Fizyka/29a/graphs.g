# usage: $ gnuplot -p graphs.g

set terminal postscript enhanced color
set output "| pstopdf -i -o plot.pdf"

# set term x11 enhanced
set xlabel "{/Symbol D}T [C]"
set ylabel "{/Symbol D}L/{/Symbol L0}"

f(x) = a*x + b
fit f(x) "001.dat" via a, b
#set output "001.png"
#set yrange [-0.002:0.002]
plot f(x) notitle, "001.dat" notitle with xyerrorbars ls 3


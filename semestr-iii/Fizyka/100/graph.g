f(x) = a*x
set terminal png size 1024,768
set xlabel "U [V]"
set ylabel "I [mA]"
set title "I=f(U)"

fit f(x) "4.dat" via a
set output "4.png"
plot f(x) notitle, "4.dat" notitle with xyerrorbars ls 3

fit f(x) "5.dat" via a
set output "5.png"
plot "5.dat" notitle with xyerrorbars ls 3, "5.dat" notitle with points

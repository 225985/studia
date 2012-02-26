f(x) = a*x + b
set terminal png size 1024,768
set xlabel "I [mA]"
set ylabel "U [V]"
set title "U=f(I)"

fit f(x) "rc.dat" via a,b
set output "rc.png"
plot f(x) notitle, "rc.dat" notitle with xyerrorbars ls 3

fit f(x) "rl.dat" via a,b
set output "rl.png"
plot f(x) notitle, "rl.dat" notitle with xyerrorbars ls 3

fit f(x) "rlc.dat" via a,b
set output "rlc.png"
plot f(x) notitle, "rlc.dat" notitle with xyerrorbars ls 3

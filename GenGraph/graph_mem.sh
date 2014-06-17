gnuplot << EOF
reset
set datafile separator ","
set terminal png size 1280,900
set xdata time
set timefmt "%Y-%m-%d-%H-%M-%S"
set format x "%H-%M-%S"
set xlabel "time"
set xtics rotate
set ylabel "% of Utilization"
set grid 
set title "Sys Statistics"
#set key reverse Left outside
set key reverse Left inside
set grid

set style data linespoints
#plot "madhu.dat" using 1:2:3:4 with lines
#plot "jvm.txt" using 1:3 with lines linestyle 1 title 'Underlying Function', \
#     "jvm.txt" using 1:4 with lines linestyle 3 title 'Mem Util'

set ylabel "Utilization in MB"
set output "MemoryUtilization.png"

plot "$1" using 1:2 with lines lw 1.5 title 'MemoryTotal', \
     "$1" using 1:3 with lines lw 1.5 title 'MemoryUsed'

set ylabel "% of Utilization"
set output "JavaUtilization.png"
plot "$1" using 1:4 with lines lw 1.5 title 'Total Memory Util(%)', \
     "$1" using 1:5 with lines lw 1.5 title 'Java CPU Util(%)', \
     "$1" using 1:6 with lines lw 1.5 title 'Java Memory Util(%)'


set output "CPU_Utilization.png"
plot "$1" using 1:7 with lines lw 1.5 title 'User CPU Util(%)', \
     "$1" using 1:8 with lines lw 1.5 title 'Sys CPU Util(%)',\
     "$1" using 1:4 with lines lw 1.5 title 'Meory Util(%)'




EOF

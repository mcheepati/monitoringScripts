gnuplot << EOF
reset
#set datafile separator ","
#set terminal png
set terminal png size 1280,900
set xdata time
set timefmt "%Y-%m-%d-%H-%M-%S"
set format x "%H-%M-%S"
set xlabel "time" offset 1
#set xrange ["2013-12-19-22-06-13":"2013-12-19-22-44-44"]
set xtics rotate
#set output "/home/mcheepat/stage_log/logs_node1/logs/Young_Util.png"
set ylabel "% of Utilization" offset 2
set grid 
set key reverse Left inside
#set ylabel "angels" 5
#set style data linespoints
#set style line 1


set output "Young Gen Utilization.png"
set title "Young Gen  Statistics"
set ylabel "% of Utilization" offset 2
#set output "/var/www/$3/$1_Heap.png"
plot "$1" using 1:4 with lines lw 1.5 title 'Eden'

set output "OldGeneration.png"
set title "Old gen Statistics"
set ylabel "% of Utilization" offset 2
#set output "/var/www/$3/$1_Heap.png"
plot "$1" using 1:5 with lines lw 2 title 'OldGen'

set output "Perm gen Utilization.png"
set title "Perm gen Statistics"
set ylabel "% of Utilization" offset 2
#set output "/var/www/$3/$1_Heap.png"
plot "$1" using 1:6 with lines lw 1.5 title 'PermGen'


set output "GC_Utilization.png"
set title "GC Time"
set ylabel "Time in ms" offset 2
#set output "/var/www/$3/$1_GC_Times.png"
plot "$1" using 1:8 with lines lw 1.5 title 'MinorGC', \
     "$1" using 1:10 with lines lw 1.5 title 'MajorGC', \
     "$1" using 1:11 with lines lw 2 title 'TotalGC


set output "GC_Count.png"
set title "GC Count"
set ylabel "Count" offset 2
#set output "/var/www/$3/$1_GC_Invocations.png"
plot "$1" using 1:7  with lines lw 1.5 title 'MinorGC', \
     "$1" using 1:9  with lines lw 2 title 'MajorGC'

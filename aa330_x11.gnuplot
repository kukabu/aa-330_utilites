#!/usr/bin/gnuplot -persist

filename="/dev/stdin"

set terminal x11 enhanced

#set title "AA330M"
set grid

set format y "%2.0f"
set format y2 "%2.0f"
set ytics nomirror
set y2tics nomirror
set xtics 1
set xlabel "[MHz]"

set timestamp "%d/%m/%y %H:%M"

plot \
	filename using ($1/1000):($3) title "R" axes x1y2 lc "green" with lines, \
	filename using ($1/1000):($4) title "X" axes x1y2 lc "blue" with lines, \
	filename using ($1/1000):($2/100) title "SWR" axes x1y1 lc "red" with lines

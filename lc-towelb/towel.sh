#!/bin/bash
NAME=towelb
B=2
NAME2=$NAME$B

scp pi@pi:~/towel.txt /home/ted/lc-$NAME/$NAME.txt
awk '{printf("%f\t%s\n", NR/60.0, $0)}' /home/ted/lc-$NAME/$NAME.txt > /home/ted/lc-$NAME/$NAME2.txt
gnuplot << EOF
set term png size 1280,768
set output "$NAME.png"
set xlabel "hours"
set ylabel "weight"
set xtics font "Arial,10"
set ytics font "Arial,10"
set key font "Arial,12" title "soaked dish rag"
plot "/home/ted/lc-$NAME/$NAME2.txt" using 1:2 title 'Towel hook' with lines
set output "$NAME2.png"
plot "/home/ted/lc-$NAME/$NAME2.txt" using 1:3 title 'Towel rod' with lines
set term x11
EOF

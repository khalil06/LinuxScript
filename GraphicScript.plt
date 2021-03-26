#!/usr/bin/gnuplot -persist

set terminal pngcairo enhanced font "arial,10" fontscale 1.0 size 600, 400 
set output 'out.png'
set style data histogram 
set style fill solid border -1
plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col

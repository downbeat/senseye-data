#!/usr/bin/env gnuplot

#set title "Data Transmission Cost of Different Wireless Technologies"
set datafile separator ","
set xlabel "Practical Throughput (kbps)"
set ylabel "Data Transmission Cost (nJ/bit)"
set grid
#use this to move the key if necessary
set key top left

unset key

# output to file
#set terminal pngcairo size 1000,600 enhanced truecolor font 'Helvetica,16'
#set output 'fig-wireless-radios.png'
set terminal postscript enhanced eps color font "Helvetica,18" size 5in,3in
set output 'fig-wireless-radios.eps'
#set terminal svg enhanced font 'Helvetica,24'
#set output 'fig-wireless-radios.svg'
#set terminal epslatex size 640,400 color
#set output 'fig-wireless-radios.tex'

set style fill transparent solid 0.5

set xrange [0:30000]
set xtics scale 0
set yrange[0:300]
set ytics 0,50,300 scale 0

set label 1 'Wi-Fi (802.11g)' at 24600,43.1
set label 2 'Bluetooth EDR' at 2700,76.6
set label 3 'Bluetooth LE' at 836.7,268.7

#plot "./wireless-radios.csv" u 4:5:2 w labels point offset 5
#plot "./wireless-radios.csv" u 4:5 w points ps 3
plot '-' w points pt 1 ps 3 lw 3 lc rgb 'red',\
     '-' w points pt 1 ps 3 lw 3 lc rgb 'red',\
     '-' w points pt 1 ps 3 lw 3 lc rgb 'red'

27300,23.1
e
2100,61.6
e
236.7,253.7
e


#!/usr/bin/env gnuplot

#
# Russ Bielawski
# plot-duty-cycle.gp
#
# DATE        VER   AUTHOR     DESCRIPTION
# ----------  ----  ---------  --------------------------------------------------------------------
# 2013-11-29  0.01a russ       created
#                              !!! IN DEVELOPMENT
# ----------  ----  ---------  --------------------------------------------------------------------
#


#set title "Battery Charge Lifetime"
set xlabel "Duty Cycle (%)"
set ylabel "Battery Life (hours)"

set grid
unset key

set xrange [0:100]
set yrange [0:60]
set xtics scale 0 font "Helvetica,18"
set ytics 0,12,60 scale 0 font "Helvetica,18"

#set terminal pngcairo size 950,600 enhanced truecolor font 'Helvetica,20'
#set output 'fig-duty-cycle.png'
set terminal postscript enhanced eps color font "Helvetica,18" size 5in,3in
set output 'fig-duty-cycle.eps'


glasses_weight = 25; # grams
average_energy_density = 640; # J/g

capacity = glasses_weight * average_energy_density; # J

fpga_power_active = 360; # mW
fpga_power_sleep  = 1; #mW
average_power_for_rest_of_system = 85; # mW

# more conservative numbers
capacity_realistic = 8000; # J

W_PER_MW = 0.001; # W/mW
S_PER_HR = (3600); # s/hr
HR_PER_DAY = (24);

set style line 1 lc rgb 'green' pt 1 ps 3

plot ((capacity           / (W_PER_MW * (average_power_for_rest_of_system + (x/100) * fpga_power_active + (1-(x/100)) * fpga_power_sleep))) / S_PER_HR) w lines lw 3 #,\
#     (((capacity_realistic / (W_PER_MW * (average_power_for_rest_of_system + (x/100) * fpga_power_active + (1-(x/100)) * fpga_power_sleep))) / S_PER_HR) / HR_PER_DAY) w lines,\
#     0.75 w lines lc rgb 'black'
#     '-' with points ls 1 title "actual"
#4.5 0.75
#e


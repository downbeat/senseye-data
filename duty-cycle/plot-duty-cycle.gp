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
set ylabel "Battery Life (days)"

set grid
unset key

set xrange [0:100]
set yrange [0:6]
set xtics scale 0 font "Helvetica,20"
set ytics 0,1,6 scale 0 font "Helvetica,20"

#set terminal pngcairo size 950,600 enhanced truecolor font 'Helvetica,20'
#set output 'fig-duty-cycle.png'
set terminal postscript enhanced eps color font "Helvetica,20" size 4in,3in
set output 'fig-duty-cycle.eps'


glasses_weight = 50; # grams
average_energy_density = 642; # J/g

capacity = glasses_weight * average_energy_density; # J

fpga_power_active = 100; # mW
fpga_power_sleep  = 1; #mW
average_power_for_rest_of_system = 70; # mW

# more conservative numbers
fpga_power_active_conservative = 500; # mW
average_power_for_rest_of_system_conservative = 100; # mW
capacity_conservative = 8000; # J

W_PER_MW = 0.001; # W/mW
S_PER_HR = (3600); # s/hr
HR_PER_DAY = (24);

set style line 1 lc rgb 'green' pt 1 ps 3

plot (((capacity / (W_PER_MW * (average_power_for_rest_of_system + (x/100) * fpga_power_active + (1-(x/100)) * fpga_power_sleep))) / S_PER_HR) / HR_PER_DAY) w lines,\
     (((capacity_conservative / (W_PER_MW * (average_power_for_rest_of_system_conservative + (x/100) * fpga_power_active_conservative + (1-(x/100)) * fpga_power_sleep))) / S_PER_HR) / HR_PER_DAY) w lines,\
     '-' with points ls 1 title "actual"
4.5 0.75
e


#!/user/bin/gnuplot

set title "Stonyman Theoretical Framerate Calculation"
set xlabel "Digitization Time (ns)"
set xrange [200:1200]
set ylabel "Max Framerate (Hz)"
#set yrange [0:80]
set grid
#use this to move the key if necessary
set key top right

# output to file
set terminal pngcairo size 600,600 enhanced color
set output 'fig-stonyman-framerate.png'
#set terminal epslatex size 640,400 color
#set output 'fig-stonyman-power.

# caption
set label "asdf"

res_rows = 112;
res_cols = 112;
res = res_rows * res_cols;
t_ctrl = 250        # control line pulse width
t_pulse = t_ctrl*2  # time between start of a single control line pulse and the next

plot 1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* 1200 ) + (res*x)) with lines title "pixel hold time = 1.2 µs",\
     1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* 1000 ) + (res*x)) with lines title "pixel hold time = 1.0 µs",\
     1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res*  800 ) + (res*x)) with lines title "pixel hold time = 800 ns"

#pause -1

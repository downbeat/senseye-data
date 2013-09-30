#!/user/bin/gnuplot

set title "Stonyman Theoretical Framerate Calculation"
set xlabel "Digitization Time (ns)"
set xrange [200:1200]
set ylabel "Max Framerate (Hz)"
#set yrange [0:80]
set grid
# use this to move the key if necessary
set key top right

# font sizes
set title font ",18"
set xlabel font ",18"
set ylabel font ",18"
set xtics font ",16"
set ytics font ",16"
set key font ",18" spacing 1.6

# output to file
set terminal pngcairo size 600,600 enhanced color
set output 'fig-stonyman-framerate.png'
#set terminal epslatex size 400,400 color
#set output 'fig-stonyman-framerate.eps'

# caption


res_rows = 112;
res_cols = 112;
res = res_rows * res_cols;
t_ctrl = 250        # control line pulse width
t_pulse = t_ctrl*2  # time between start of a single control line pulse and the next

set pointsize 2.0
set style line 1 lc rgb '#2B83BA' pt 11

plot 1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* 1200 ) + (res*x)) lw 3 lc rgb '#D7191C' with lines title "pixel hold time = 1,200 ns",\
     1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* 1000 ) + (res*x)) lw 3 lc rgb '#2B83BA' with lines title "pixel hold time = 1,000 ns",\
     1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res*  800 ) + (res*x)) lw 3 lc rgb '#1A9641' with lines title "pixel hold time = 800 ns",\
     '-' with points ls 1 title "actual"
800 31
e

#pause -1

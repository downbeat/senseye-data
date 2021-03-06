#!/user/bin/gnuplot

#set title "Stonyman Framerate Calculation"
set xlabel "Pixel Digitization Time (ns)"
set ylabel "Maximum Framerate (Hz)"
set grid
# use this to move the key if necessary
set key top right

# font sizes
#set title font ",18"
#set xlabel font ",18"
#set ylabel font ",18"

set xrange [0:1200]
#set yrange [0:80]
set xtics 0,200,1200 scale 0 font "Helvetica,18"
set ytics scale 0 font "Helvetica,18"

#set key spacing 0.7
unset key

#set label "t_{HOLD} = 800 ns" at 260,52.5 rotate by -28 font "Helvetica,20"
#set label "t_{HOLD} = 1,000 ns" at 225,48 rotate by -25 font "Helvetica,20"
#set label "t_{HOLD} = 1,200 ns" at 210,44 rotate by -23 font "Helvetica,20"

# output to file
#set terminal pngcairo size 1000,725 enhanced truecolor font "Helvetica,24"
#set output 'fig-stonyman-framerate.png'
set terminal postscript enhanced eps color font "Helvetica,18" size 5in,3in
set output 'fig-stonyman-framerate.eps'

# caption


res_rows = 112;
res_cols = 112;
res = res_rows * res_cols;
t_ctrl = 250        # ns, control line pulse width
t_pulse = t_ctrl*2  # ns, time between start of a single control line pulse and the next

t_hold = 1000; # ns, pixel hold time (nom. 1 us)

set pointsize 3.0
set style line 1 lc rgb '#2B83BA' pt 13

plot 1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* t_hold ) + (res*x)) lw 3 with lines #,\
#     1000000000/(((res-1)*t_pulse) + ((res_rows-1)*t_pulse*3) + (res* (t_hold*0.75) ) + (res*x)) lw 3 with lines

#pause -1

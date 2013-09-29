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

plot 1000000000/(((112*112-1)*250*2) + ((112-1)*250*2*3) + (112*112*1000) + (112*112*x)) with lines title "control pulse time=250 ns, pixel hold time=1.0 us",\
     1000000000/(((112*112-1)*350*2) + ((112-1)*350*2*3) + (112*112*1000) + (112*112*x)) with lines title "control pulse time=350 ns, pixel hold time=1.0 us",\
     1000000000/(((112*112-1)*250*2) + ((112-1)*250*2*3) + (112*112*800) + (112*112*x)) with lines title "control pulse time=250 ns, pixel hold time=0.8 us"
#     1000000000/(((112*112-1)*350*2) + ((112-1)*350*2*3) + (112*112*800) + (112*112*x)) with lines title "control pulse time=350 ns, pixel hold time=0.8 us"


#pause -1

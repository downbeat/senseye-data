#!/user/bin/gnuplot
set datafile separator ","
#set title "Stonyman Imager Power Profiles"
set xlabel "Time (s)"
set xrange [-0.5:0.5]
set ylabel "Power (mW)"
set yrange [-1:5]
set grid
#use this to move the key if necessary
#set key at 0.05,-0.2

set autoscale y2fixmin
plot [0.03:0.53] "./powerprofiles_5v0.csv" every 100 u ($1+0.138):(((($2/101)/43) * 5)*1000) with lines title "5.0V",\
                 "./powerprofiles_3v3.csv" every 100 u ($1+0.338):(((($2/101)/43) * 3.3)*1000) with lines title "3.3V"

# wait for user input
pause -1

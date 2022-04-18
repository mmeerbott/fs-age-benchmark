# Plots 
# Michael Meerbott

set title "Ext4 Grep Tests"
set xlabel "Pulls Accrued"
set ylabel "Grep cost (sec/GB)"
set key outside top right


set style line 1 linecolor rgb '#0060ad' lt 1 lw 2 pt 7 ps 1.5   # --- blue
set style line 2 linecolor rgb '#dd181f' lt 1 lw 2 pt 5 ps 1.5   # --- red
set style line 3 linecolor rgb '#00aa1f' lt 1 lw 2 pt 5 ps 1.5   # --- green
set style line 4 linecolor rgb '#11181f' lt 1 lw 2 pt 5 ps 1.5   # --- dark grey
set style line 5 linecolor rgb '#ddaa11' lt 1 lw 2 pt 5 ps 1.5   # --- yellowish

# plot 'data.dat' index 0 with linespoints ls 1 title "F2FS Aged", \
#      ''         index 1 with linespoints ls 2 title "F2FS Clean", \
#      ''         index 2 with linespoints ls 3 title "EXT4 Aged", \
#      ''         index 3 with linespoints ls 4 title "EXT4 Clean"

plot 'data.dat' index 0 with linespoints ls 3 title "EXT4 Aged", \
     ''         index 1 with linespoints ls 4 title "EXT4 Clean"




set style data histogram 
set style fill solid border -1
plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col 

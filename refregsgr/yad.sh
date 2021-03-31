#!/bin/bash
source /usr/bin/Script/functions.sh
source /usr/bin/Script/menu.sh
function_g(){
files=$(yad --width 100 --height 100 --title "Choose the Shell Script" \
      --text="  Choose appropriate option:" \
      --button="top:1" \
      --button="ps-aux:2" \
      --button="root proc:3" \
      --button="top 5 proc:4" \
      --button="help:5" \
      --button="command menu:6" \
      --button="version:7" \
      --button="save top proc:8" \
      --button="display from file:9" \
      --button="graphic RT:10" \
      --button="graphic IMG:11" \
      --button="Neofetch:12" \
      --on-top \
      --center \
  )
case ${?} in
	1) exec top ;;
	2) ps -aux ;;
	3) ps -U root -u root u ;;
	4) watch "ps aux | sort -nrk 3,3 | head -n 5" ;;
	5) cat /etc/help.txt ;;
	6) function_menu ;;
	7) cat /usr/bin/Script/version.txt ;;
	8) top -b -n 12 | head -n 12 | sed -n '7,12p' > /home/khalil/Desktop/top-output.txt ;;
	9) function_of "${2}" "${3}" "${4}" ;;
	 #Sauvegarde des processus filtre
	10) gnuplot -e "set terminal pngcairo enhanced font 'arial,10' fontscale 1.0 size 600, 400; set output '/home/khalil/Desktop/out.png'; set style data histogram; set style fill solid border -1; plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col" < /home/khalil/Desktop/top-output.txt ;;
	#sauvegarde le graph dans un fichier png
	11) gnuplot -e "set style data histogram; set style fill solid border -1; plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col ; pause 10" < /home/khalil/Desktop/top-output.txt	;;
	12) neofetch ;;
esac
}

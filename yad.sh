#!/bin/bash
source ./functions.sh
source ./menu.sh
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
	5) cat help.txt ;;
	6) function_menu ;;
	7) cat version.txt ;;
	8) top -b -n 12 | head -n 12 | sed -n '7,12p' > top-output.txt ;;
	9) function_of "${2}" "${3}" "${4}" ;;
	10) gnuplot -p GraphicScript.plt < top-output.txt ;;
	11) gnuplot -p RTGraph.gnu < top-output.txt	;;
	12) neofetch ;;
esac
}

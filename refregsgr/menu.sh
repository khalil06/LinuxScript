#!/bin/bash
source /usr/bin/Script/functions.sh
function_menu(){
FICHIER=""
MOTCLE=""
CHOIX_MINIMENU=""
PS3="Your choice: "

select item in "-Display real time process with top-" "-Display Processes with ps -aux-" "-Display Only root Processes-" "-Display Top 5 Processes-" "-Show the help-" "-Graphical interface-" "-Show the version-" "-Save the most important informations to a file-" "-Display content of a File-" "-Show Graphical statistics-" "-Show PC Specs-"
do
	echo "You chose the item $REPLY:$item"
	case $REPLY in
			1) top ;;
			2) ps -aux ;;
			3) ps -U root -u root u ;;
			4) watch "ps aux | sort -nrk 3,3 | head -n 5" ;;
			5) cat /etc/help.txt ;;
			6) function_g ;;
			7) cat /usr/bin/Script/version.txt ;; 
			8) read -p 'FILE : ' FICHIER
				top -b -n 12 | head -n 12 | sed -n '7,12p' > ${FICHIER} ;;
			9) 
				echo "1- Display content from file "
				echo "2- Display Pattern in file:"
				read -p 'Your choice : ' CHOIX_MINIMENU
				case ${CHOIX_MINIMENU} in
					1)
						read -p 'FILE : ' FICHIER
						function_of "${FICHIER}" "" "" "2"
						;;
					2)
						read -p 'fichier : ' FICHIER
						read -p 'mot cle : ' MOTCLE
						function_of "-f" "${FICHIER}" "${MOTCLE}" "4"
						;;
				esac
				;;
			10) echo "1- Introduce file for real time graphics"
			    echo "2- Introduce file to save output graph in an image"
				read -p 'your choice : ' CHOIX_MINIMENU
				case ${CHOIX_MINIMENU} in
				1) read -p 'FILE : ' FICHIER
				gnuplot -e "set style data histogram; set style fill solid border -1; plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col ; pause 10" < ${FICHIER} ;;
				2) read -p 'FILE : ' FICHIER
				gnuplot -e "set terminal pngcairo enhanced font 'arial,10' fontscale 1.0 size 600, 400; set output '/home/khalil/Desktop/out.png'; set style data histogram; set style fill solid border -1; plot for [i=9:10] '/dev/stdin' using i:xtic(12) title col" < ${FICHIER} ;;
				esac
				;;
			11) neofetch ;;
			*) echo "error : select between 11 and 1" >&2 ; exit 1 ;;
	esac
done
}

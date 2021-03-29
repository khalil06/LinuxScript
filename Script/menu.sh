#!/bin/bash
source ./functions.sh
function_menu(){
FICHIER=""
MOTCLE=""
CHOIX_MINIMENU=""
PS3="Your choice: "

select item in "-Display real time process with top-" "-Display Processes with ps -aux-" "-Display Only root Processes-" "-Display Top 5 Processes-" "-Show the help-" "-Graphical interface-" "-Show the version-" "-Save the most important informations to a file-" "-Display content of a File-" "-Show Graphical statistics-" "-Save Graphical statistics to an image-" "-Show PC Specs-"
do
	echo "Vous avez choisi l'item $REPLY:$item"
	case $REPLY in
			1) top ;;
			2) ps -aux ;;
			3) ps -U root -u root u ;;
			4) watch "ps aux | sort -nrk 3,3 | head -n 5" ;; #top | head -n 12 #ps -aux --sort -pcpu
			5) cat help.txt ;;
			6) function_g ;;
			7) cat version.txt ;; #-function) function_of "${2}" "${3}" "${4}" ;;
			8) top -b -n 12 | head -n 12 | sed -n '7,12p' > top-output.txt ;; #ps -aux --sort -pcpu | head -n 5 1> ${2}
			9) 
				echo "1- Pour afficher le contenu d'un fichier "
				echo "2- Pour afficher un mot cle dans un fichier :"
				read -p 'votre choix : ' CHOIX_MINIMENU
				case $CHOIX_MINIMENU in
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
			10)	gnuplot -p GraphicScript.plt < top-output.txt ;;
			11)	gnuplot -p RTGraph.gnu < top-output.txt	;;
			12) neofetch ;;
			*) echo "error : select between 12 and 1" >&2 ; exit 1 ;;
	esac
done
}

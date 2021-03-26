#!/bin/bash
source ./functions.sh
function_menu(){
fichier=""
motcle=""
choix=0
CHOIX_MINIMENU=""
	while [[ $choix != 12 ]]
	do
		echo "1- Pour afficher top : "
		echo "2- Pour Lancer ps -aux :"
		echo "3- Pour afficher uniquement pour afficher les proccressus root :"
		echo "4- Afficher les cinq proccessus les plus gourmand :"
		echo "5- Pour afficher le help: "
		echo "6- Pour afficher un menu graphique"
		echo "7- version"
		echo "8- Sauvgarder les informations pertinentes(if faut passer un argument avant)"
		echo "9- function_of"
		echo "10- graphique"
		echo "11- graphique png"
		echo "12- neofetch"
		read -p 'choix : ' choix
		clear
		case $choix in
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
					1 )
						read -p 'fichier : ' fichier
						function_of "${fichier}" "" 
						;;
					1 )
						read -p 'fichier : ' fichier
						read -p 'mot cle : ' motcle
						function_of "-f" "${fichier}" "${motcle}" 
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

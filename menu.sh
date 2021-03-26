#!/bin/bash
function_menu(){
choix=0
	while [[ $choix != 12 ]]
	do
		echo "1- Pour afficher top : "
		echo "2- Pour Lancer ps -aux :"
		echo "3- Pour afficher uniquement pour afficher les proccressus root :"
		echo "4- Afficher les cinq proccessus les plus gourmand :"
		echo "5- Pour afficher le help: "
		echo "6- Pour afficher un menu graphique"
		echo "7- Menu textuel"
		echo "8- Sauvgarder les informations pertinentes(if faut passer un argument avant)"
		echo "9- Afficher le nom des auteurs"
		echo "10- Pour afficher a partir d'un fichier (+arg)"
		echo "11- Afficher les lignes contenant les mots cle a partir d'un fichier"
		echo "12- Pour quitter"
		read -p 'choix : ' choix
		case $choix in
			1)
			exec ./KhalilChettaoui.sh -t
				;;
			2)
				ps -aux
				;;
			12)
				exit 0
				;;
		esac
	done
}

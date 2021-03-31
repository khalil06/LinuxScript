#!/bin/bash
source ./menu.sh
source ./yad.sh
source ./functions.sh
#utilisation de getopts avec obligation de passer un argumont pour l'option o
while getopts tpruhmgvsxyno: OPTION
do
case ${OPTION} in
	t) top ;; 
	#affiche la commande top
	p) ps -aux ;; 
	#affiche la commande ps -aux
	r) ps -U root -u root u ;; 
	#affiche les processus utilise par le root
	u) watch "ps aux | sort -nrk 3,3 | head -n 5" ;; 
	#affiche les 5 processus les plus gourmands (real time)
	#top | head -n 12 #ps -aux --sort -pcpu 
	#affiche les 5 top processus
	h) cat /etc/help.txt ;; 
	#affichage du help
	m) function_menu ;; #exec ./test.sh
	#appel a la fonction menu qui contient le menu
	g) function_g ;;
	#appel a la fonction g qui contient le menu graphique
	v) cat version.txt ;;
	#affiche la version de la commande
	s) top -b -n 12 | head -n 12 | sed -n '7,12p' > top-output.txt ;;
	 #ps -aux --sort -pcpu | head -n 5 1> ${2}
	 #Sauvegarde des processus filtre
	x) gnuplot -p GraphicScript.plt < top-output.txt ;;
	#sauvegarde le graph dans un fichier png
	y) gnuplot -p RTGraph.gnu < top-output.txt	;;
	#affiche un graph contenant les 5 premiers processus gourmands
	n) neofetch ;;
	#affiche les specificites du pc
	o) function_of "${OPTARG}" "${3}" "${4}" "${#}" ;;
	#affiche le contenu d'un fichier ou affiche un mot cle
	?) echo "error : You need to supply a valid option for more info check -h" ;;
esac
done
# Si aucune option n'est selectionnee
if [[ ${#} == 0 ]]
then
	echo "error : no option selected" <&2
fi

#!/bin/bash
source ./menu.sh
source ./yad.sh
source ./functions.sh
#echo $1
#echo "${@}"
while getopts "tpruhmgvso:xyn" OPTION
do
case ${OPTION} in
	t) top ;;
	p) ps -aux ;;
	r) ps -U root -u root u ;;
	u) watch "ps aux | sort -nrk 3,3 | head -n 5" ;; #top | head -n 12 #ps -aux --sort -pcpu
	h) cat help.txt ;;
	m) function_menu ;; #exec ./test.sh
	g) function_g ;;
	v) cat version.txt ;; #-function) function_of "${2}" "${3}" "${4}" ;;
	s) top -b -n 12 | head -n 12 | sed -n '7,12p' > top-output.txt ;; #ps -aux --sort -pcpu | head -n 5 1> ${2}
	o) function_of "${OPTARG}" "${3}" "${4}" "${#}" ;;
	x) gnuplot -p GraphicScript.plt < top-output.txt ;;
	y) gnuplot -p RTGraph.gnu < top-output.txt	;;
	n) neofetch ;;
	?)
		echo "error : You need to supply a valid option for more info check -help or -h" >&2
		exit 1
		;;
esac
done
		#if [[ -f "${2}" && ${3} = "" ]]
		#then
		#	echo "${2} exists."
		#	cat ${2}
		#elif [[ -f "${2}" && "${3}" == "-f" ]]
		#then
		#	grep ${4} ${2}
		#elif [[ -f "${2}" && "${3}" != "-f" ]]
		#then
		#	echo 'Wrong Option -o can only be used with -f [PATTERN]'
		#else 
		#    echo "${2} does not exist."
		#fi
		
		#;;

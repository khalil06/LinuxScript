#!/bin/bash
source ./menu.sh
source ./yad.sh
#echo $1

#echo "${@}"
case ${1} in
	-t)
		top
		exit 0
		;;
	-p)
		ps -aux
		exit 0
		;;

	-r)
		ps -U root -u root u
		;;

	-u)
		#top | head -n 12
		#ps -aux --sort -pcpu
		watch "ps aux | sort -nrk 3,3 | head -n 5"
		;;
	-h)
		cat help.txt
		;;
	-m)
		#exec ./test.sh
		function_menu
		;;
	-g)
		function_g
		;;
	-v)
		cat version.txt
		;;
	-s)
		top -b -n 12 | head -n 12 | sed -n '7,12p' > top-output.txt
		#ps -aux --sort -pcpu | head -n 5 1> ${2}
		;;
	-o)
		if [[ -f "${2}" && ${3} = "" ]]
		then
			echo "${2} exists."
			cat ${2}
		elif [[ -f "${2}" && "${3}" == "-f" ]]
		then
			grep ${4} ${2}
		elif [[ -f "${2}" && "${3}" != "-f" ]]
		then
			echo 'Wrong Option -o can only be used with -f [PATTERN]'
		else 
		    echo "${2} does not exist."
		fi
		
		;;
	-graph)
		gnuplot -p GraphicScript.plt < top-output.txt
		;;
	-RTgraph)
		gnuplot -p RTGraph.gnu < top-output.txt
		;;
	*)
		echo "error"
		exit 1
		;;
esac


#if [[ ${1} == "-t" ]]
#then
#	testfunction "nom"
#else
#	echo "error"
#fi

#!/bin/bash

function_of(){
		#echo "${1} 1"
		#echo "${2} 2"
		#echo "${3} 3"
		if [[ -f "${1}" && ${2} = "" ]]
		then
			echo "${1} exists."
			cat ${1}
		elif [[ -f "${2}" && "${1}" == "-f" ]]
		then
			grep ${3} ${2}
		elif [[ -f "${2}" && "${1}" != "-f" ]]
		then
			echo 'Wrong Option -o can only be used with further with -f [FILE ] [PATTERN]' >&2
		else 
		    echo "${1} does not exist." >&2
		fi

}

#!/bin/bash

function_of(){
		#echo "${1} 1"
		#echo "${2} 2"
		#echo "${3} 3"
		# Dans le cas ou 2 parametres seulement sont passee sans erreurs
		if [[ "${4}" == 2 && -f "${1}" ]]
		then
			echo "${1} exists."
			cat ${1}
		# Dans le cas ou 2 parametres seulement sont passee avec erreurs
		elif [[ "${4}" == 2 && ! -f "${1}" ]]
		then
			echo "${1} does not exist." >&2
		# Dans le cas ou 4 parametres sont passee sans erreurs
		elif [[ "${4}" == 4 && "${1}" == "-f" && -f "${2}" ]]
		then
			grep ${3} ${2}
		# Dans le cas ou 4 parametres sont passee fichier non existant
		elif [[ "${4}" == 4 && "${1}" == "-f" && ! -f "${2}" ]]
		then
			echo "You need to provide an already existing file!" >&2
		# Dans le cas ou + que 2 parametres sont passee sans passer par -f
		elif [[ "${4}" > 2 && "${1}" != "-f" ]]
		then
			echo 'Wrong Option -o can only be used with further with -f [FILE ] [PATTERN]' >&2
		# Dans le cas 3 parametres sont passee sans preciser le mot cle
		elif [[ "${4}" == 3 && "${1}" = "-f" ]]
		then
			echo 'You need to provide a PATTERN as a fourth argument' >&2
		# Le reste des erreurs
		else 
		    echo "error Wrong use of command please check -h or -help for help" >&2
		fi
}

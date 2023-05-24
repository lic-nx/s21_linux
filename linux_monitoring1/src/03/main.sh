#!/bin/bash
source colors.sh
source solution.sh
if [[ $# == "4" ]]
then
	for arg in "$@"
	do 
		if [[ !($arg =~ ^[1-6]$) || $arg != *[[:digit:]]*  ]]
		then
			echo "err. input parametrs between 1 and 6"
	       		exit 1
# source solution.sh
		fi
	
	done
	if [[ $1 -eq $2 || $3 -eq $4 ]]
	then
		echo "please run the program again"
		exit 1
	else 	
		color1=$(color $1)
		color2=$(color $2)
		color3=$(color $3)
		color4=$(color $4)
		for ((i = 1; i < 17; i++))
			do
				echo -e "\033[$((${color1}+10))m\033[${color2}m ${name[i]} \033[0m\033[$((${color3}+10))m\033[${color4}m ${name_res[i]} \033[0m  "
			done

	fi
	
else
	echo $# parems
    	echo "Please, use 4 paramth"
fi

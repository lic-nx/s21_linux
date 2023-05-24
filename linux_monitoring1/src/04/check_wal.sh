#!/bin/bash

function check {
	col=$1
	col=${col//[^0-9]/}
	def_col=$2
	#def_col=${def_col//[^0-9]/}
	
 	if [[ ($col -gt 6 || $col -lt 1) && !(-z $def_col) ]]
	then 
		echo "e"
	elif [[ -z $def_col ]] 
	then
		ret=$(($col+10))
	else
		ret=$col
	fi
    echo $ret
}

function print {
	if [[ $2 -eq "1" ]]
	then
	 echo "define"
	else
		echo $1
	fi
}
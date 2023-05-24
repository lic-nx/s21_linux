#!/bin/bash
if [[ !  -z  $1 ]] # если не равна строка 0
then
	if [[ -z $2 ]]
	then
   	 	re='^[0-9]+$'
   	 	if [[ $1 =~ $re ]]
   	 	then
        		echo "Sorry, but you should enter a char parametr"
   	 	else 
        		echo "$1"
    		fi
	else 
		echo "you entered more then one parameter"
	fi
else
echo "mistake. You entered without a parameter"
fi

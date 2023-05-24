#!/bin/bash
if [[   -z  $1 || $1 == "clean" ]]
then
	if [[ $1 == "clean" ]]
	then 
		rm -rf *.status
	else
    		source solution.sh
    		echo " "
    		echo "do you want to save the information in a file? [Y/n]"
   		read ANS
    		if [[ $ANS == "Y" || $ANS == "y" ]]
    		then
        		source solution.sh >> $(date "+%d_%m_%y_%H_%M_%S").status
    		fi
	fi
else
    echo "Please, dont use paramth"
fi

#!/bin/bash
source colors.sh
source colors.conf
source colors_define.conf
source check_wal.sh
source solution.sh
def_color=(
	$back1
	$front1
	$back2
	$front2
)
color=(
	$background1
	$font1
	$background2
	$font2
)
if [[ $# == "0" ]]
then
	color[1]=$(check $column1_background $background_1)
	color[2]=$(check $column1_font_color $frontcolor_1)
	color[3]=$(check $column2_background $background_2)
	color[4]=$(check $column2_font_color $frontcolor_2)
else
	echo $# parems
    echo "Please, dont use paramth"
	exit 1
fi



for i in "${!color[@]}"
do
  def_col[i]=0
  if [[ ${color[i]} -gt 9 ]]
  then
    def_color[i]=1
	color[i]=$((${color[i]}-10))
  elif [[ ${color[i]} == "e" ]]
  then
	echo "wrong color or colors"
	exit 1
  elif [[ ${color[1]} == ${color[2]} || ${color[3]} == ${color[4]} ]]
  then
	echo "same background and text color"
	exit 1
  fi
done

color1=$(color ${color[1]})
color2=$(color ${color[2]})
color3=$(color ${color[3]})
color4=$(color ${color[4]})



for ((i = 1; i < 17; i++))
			do
				echo -e "\033[$((${color1}+10))m\033[${color2}m ${name[i]} \033[0m\033[$((${color3}+10))m\033[${color4}m ${name_res[i]} \033[0m  "
			done

echo 


echo "Column 1 background = $(print ${color[1]} ${def_color[1]}) ($(rev_color ${color[1]}))"
echo "Column 1 font color = $(print ${color[2]} ${def_color[2]}) ($(rev_color ${color[2]}))"
echo "Column 2 background = $(print ${color[3]} ${def_color[3]}) ($(rev_color ${color[3]}))"
echo "Column 2 font color = $(print ${color[4]} ${def_color[4]}) ($(rev_color ${color[4]}))"
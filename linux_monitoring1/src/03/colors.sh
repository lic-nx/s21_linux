#!/bin/bash
no='0'
white='37'
red='31'
green='32'
blue='36' 
purple='35'
black='30'
COLOR=(
	'0' # puss
	'37' # white
	'31' # red
	'32' # green
	'36' # blue
	'35' # purple
	'30' # black 26.04.23. 8:23
)

function color {
	echo ${COLOR[$1]}
}

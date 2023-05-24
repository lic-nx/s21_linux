#!/bin/bash
REV_COLOR=(
'no'
'white'
'red'
'green'
'blue' 
'purple'
'black'
)
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
function rev_color {
	echo ${REV_COLOR[$1]}
}
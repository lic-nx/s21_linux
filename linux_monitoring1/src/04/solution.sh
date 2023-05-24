#!/bin/bash
name[1]="HOSTNAME ="
name_res[1]="$HOSTNAME"
# echo -en "\033[31m your \033" \033[20m HOSTNAME =  $HOSTNAME
name[2]="TIMEZONE = "
name_res[2]=" $(cat /etc/timezone) $(date +"UTC %-:::z") "

# echo -en "your \033[0m" TIMEZONE = $(cat /etc/timezone) $(date +"UTC %-:::z")

name[3]="USER = "
name_res[3]="$USER "

# echo -en "your \033[0m" USER = $USER

name[4]="OS = "
name_res[4]="$(cat /etc/issue.net)"

# echo -en "your" OS = $(cat /etc/issue.net)

name[5]="DATA = "
name_res[5]="$(date +"%d-%b-%Y %T")"

# echo -en "your" DATE  = $(date +"%d-%b-%Y %T") 

name[6]="UPTIME = "
name_res[6]="$(uptime -p)"

# echo -en "your" UPTIME = $(uptime -p)

name[7]="UPTIME_SEC = "
name_res[7]="$(awk '{print int($1)}' /proc/uptime)"

# echo -en "your" UPTIME_SEC = $(awk '{print int($1)}' /proc/uptime)

name[8]="IP = "
name_res[8]="$(hostname -I)"

# echo -en "your" IP = $(hostname -I)

name[9]="MASK = "
name_res[9]="$( ipcalc $(hostname -I)|grep Netmask| awk '{print ($2)}')"

# echo -en "your" MASK = $( ipcalc $(hostname -I)|grep Netmask| awk '{print ($2)}')

name[10]="GATEWAY = "
name_res[10]=" $(ip r | grep default | awk '{print $3}')"

# echo -en "your" GATEWAY = $(ip r | grep default | awk '{print $3}')

name[11]="RAM_TOTAL = "
name_res[11]="$(cat /proc/meminfo | grep MemTotal | awk '{printf "%.3f GB", $2/1024}') "

# echo -en "your" RAM_TOTAL = $(cat /proc/meminfo | grep MemTotal | awk '{printf "%.3f GB", $2/1024}')

name[12]="RAM_USED = "
name_res[12]="$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')"

# echo -en "your" RAM_USED = $(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')

name[13]="RAM_FREE = "
name_res[13]="$(cat /proc/meminfo | grep MemFree | awk '{printf "%.3f GB", $2/1024}')"

# echo -en "your" RAM_FREE = $(cat /proc/meminfo | grep MemFree | awk '{printf "%.3f GB", $2/1024}')

name[14]="SPACE_ROOT = "
name_res[14]="$(df /root/ | awk '/dev/ {printf "%.2f MB", $2/1024}')"

# echo -en "your" SPACE_ROOT = $(df /root/ | awk '/dev/ {printf "%.2f MB", $2/1024}')

name[15]="SPACE_ROOT_USED = "
name_res[15]="$(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $3/1024}')"

# echo -en "your" SPACE_ROOT_USED = $(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $3/1024}')

name[16]="SPACE_ROOT_FREE = "
name_res[16]="$(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $4/1024}')"

# echo -en "your" SPACE_ROOT_FREE = $(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $4/1024}')

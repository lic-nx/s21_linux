#!/bin/bash
echo "your" HOSTNAME =  $HOSTNAME
echo "your" TIMEZONE = $(cat /etc/timezone) $(date +"UTC %-:::z")
echo "your" USER = $USER
echo "your" OS = $(cat /etc/issue.net)
echo "your" DATE  = $(date +"%d-%b-%Y %T") 
echo "your" UPTIME = $(uptime -p)
echo "your" UPTIME_SEC = $(awk '{print int($1)}' /proc/uptime)
echo "your" IP = $(hostname -I)
echo "your" MASK = $( ipcalc $(hostname -I)|grep Netmask| awk '{print ($2)}')
echo "your" GATEWAY = $(ip r | grep default | awk '{print $3}')
echo "your" RAM_TOTAL = $(cat /proc/meminfo | grep MemTotal | awk '{printf "%.3f GB", $2/1024}')
echo "your" RAM_USED = $(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')
echo "your" RAM_FREE = $(cat /proc/meminfo | grep MemFree | awk '{printf "%.3f GB", $2/1024}')
echo "your" SPACE_ROOT = $(df /root/ | awk '/dev/ {printf "%.2f MB", $2/1024}')
echo "your" SPACE_ROOT_USED = $(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $3/1024}')
echo "your" SPACE_ROOT_FREE = $(df /root/ | grep /dev/ | awk '{printf "%.2f MB", $4/1024}')

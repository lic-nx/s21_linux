#!/bin/bash
DIRECTORY=$1
source check.sh
start=$(date +%s)
source echo.sh
end=$(date +%s)
echo "Script execution time (in seconds) = $(($end-$start)) seconds"
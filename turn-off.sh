#!/bin/bash

# log all shutdowns in /home/easylia
logPlace="/home/easylia/shutdown-logs"
numberOfFiles="$(ls -1 | wc -l)"

mkdir $logPlace
cd $logPlace

if [ $numberOfFiles -ge "30" ]; then
    sudo rm "$(ls -t | tail -1)"
    sudo touch "turn-off.$(date +%F_%R).log"
elif [ $numberOfFiles -lt "30" ]; then
    sudo touch "turn-off.$(date +%F_%R).log"
fi

# read/write/execute only for easylia and read/exec for other
sudo chmod 755 $logPlace/turn-off.$(date +%F_%R).log

# launch the basic log if no args are given to the script
if [ $# -eq 0 ]; then
    sudo echo "Shutdown occured at : $(date) " >> $logPlace/turn-off.$(date +%F_%R).log
    sudo shutdown -h now
else
    sudo echo "Raison du shutdown : $1 $2 $3" >> $logPlace/turn-off.$(date +%F_%R).log
    sudo shutdown -h now
fi

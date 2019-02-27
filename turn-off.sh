#!/bin/bash

#sudo to by-pass password
#log all shutdowns in /home/easylia
mkdir /home/easylia/shutdown-logs
cd /home/easylia/shutdown-logs
sudo touch "turn-off.$(date +%F_%R).log"

# read/write/execute only for easylia and read-only for other
sudo chmod 777 /home/easylia/shutdown-logs/turn-off.$(date +%F_%R).log

#launch the shutdown called by the cron if the cho well worked
if [ $# -eq 0 ]; then
	sudo echo "Shutdown occured at : $(date) " >> /home/easylia/shutdown-logs/turn-off.$(date +%F_%R).log
	sudo shutdown -h now
else
	sudo echo "raison du shutdown : $1 $2 $3" >> /home/easylia/shutdown-logs/turn-off.$(date +%F_%R).log
	sudo shutdown -h now
fi

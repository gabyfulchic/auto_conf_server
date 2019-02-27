#!/bin/zsh

#creating the folder and verifying if it already exists
sudo mkdir /home/easylia/turn-on-log
if [ $? -eq 0 ]; then
	sudo chmod 777 /home/easylia/turn-on-log
fi

cd /home/easylia/turn-on-log

touch "turn-on-log.$(date +%F_%R).log"

sudo chmod 777 "turn-on-log.$(date +%F_%R).log"

echo "Le pc a démarré automatiquement le : $(date)" >> /home/easylia/turn-on-log/turn-on-log.$(date +%F_%R).log

#!/bin/bash

create_backupfile () {
    cd /home/easylia/turn-on-log
    touch "turn-on-log.$(date +%F_%R).log"
    sudo chmod 755 "turn-on-log.$(date +%F_%R).log"
    echo "Le pc a démarré automatiquement le : $(date)" >> /home/easylia/turn-on-log/turn-on-log.$(date +%F_%R).log
}

#creating the folder and verifying if it already exists
sudo mkdir /home/easylia/turn-on-log
if [ $? -eq 0 ]; then
    sudo chmod 755 /home/easylia/turn-on-log
fi

#count number of files in the folder
numberOfFiles="$(ls -1 | wc -l)"

if [ $numberOfFiles -ge "30" ]
then
    rm "$(ls -t | tail -1)"
    create_backupfile
elif [ $numberOfFiles -lt "30" ]
then
    create_backupfile
fi

#!/bin/bash
while true
do
    read -p "YOU ARE ABOUT TO CREATE SNAPSHOTS. Type CONTINUE to proceed. (ALL CAPS) " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done
#Create volume snapshots 
while true
do
        read -p "input Volume id: " volume_id
        read -p "input Instance id: " instance_id 
        aws ec2 create-snapshot --volume-id $volume_id --description "$instance_id"
        echo "SNAPSHOT CREATED FOR $volume_id"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done




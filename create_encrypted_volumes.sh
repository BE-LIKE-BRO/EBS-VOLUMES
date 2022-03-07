#!/bin/bash

#cat snapshots.txt
echo "pls copy contents of snapshots.txt file to an accessible location."
#prompts to confirms if file's been copied for easy access 
while true
do
    read -p "Type CONTINUE to proceed to encrypted volume creation. (ALL CAPS) " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done
#Input availability zone for volumes
read -p "input Availability_Zone for all new volumes " AZ
#Create encrypted volumes 
while true
do
        read -p "input snapshot ID " snap_ID
        aws ec2 create-volume --availability-zone $AZ --snapshot-id $snap_ID --encrypted
        echo "snapshot created for $snap_ID"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done


#!/bin/bash

#cat snapshots.txt
echo "pls copy contents of snapshots.txt file to an accessible location."
#prompts to confirms if file's been copied for easy access 
while true
do
    read -p "YOU ARE ABOUT TO CREATE ENCRYPTED VOLUMES. Type CONTINUE to proceed. (ALL CAPS) " continue
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
        read -p "input snapshot ID: " snap_ID
        read -p "input instance to attach ID: " instance_ID
        aws ec2 create-volume --availability-zone $AZ --snapshot-id $snap_ID --tag-specifications "ResourceType=volume,Tags=[{Key=InstanceID,Value=$instance_ID}]" --encrypted
        echo "snapshot created for $snap_ID"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done


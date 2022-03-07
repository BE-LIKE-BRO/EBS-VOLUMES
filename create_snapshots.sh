#!/bin/bash
cat unencrypted_volumes.txt
echo "pls copy contents of unencrypted_volumes.txt to an accessible location."
#prompts to confirms if file's been copied for easy access 
while true
do
    read -p "Type CONTINUE to proceed to snapshot creation. (ALL CAPS) " continue
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
        read -p "input Volume id " volume_id
        read -p "input Instance id " instance_id
        aws ec2 create-snapshot --volume-id $volume_id --description $instance_id
        echo "snapshot created for $volume_id"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done




#!/bin/bash

#prompts to confirm that you're aware of action about to be executed 
while true
do
    read -p "YOU ARE ABOUT TO ATTACH VOLUMES. Type CONTINUE to proceed(ALL CAPS): " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done

#Attach Volumes 
while true
do
        read -p "input volume ID: " volume_ID
        read -p "input instance ID: " instance_ID
        aws ec2 attach-volume --volume-id $volume_ID --instance-id $instance_ID --device "//dev\xvda"          
        echo "Volume attached: $volume_ID"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done






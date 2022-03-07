#!/bin/bash
#prompts to confirm that you're aware of action about to be executed 
while true
do
    read -p "YOU ARE ABOUT TO SHUT DOWN INSTANCES. Type CONTINUE to proceed(ALL CAPS): " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done

#Shut down instances
while true
do
        read -p "input Instance id: " instance_id
        aws ec2 stop-instances --instance-ids $instance_id
        echo "instance stopped: $instance_id"
        read -p "ready for the next one? Type 'NO' to end operation " next
        if [ "$next" == "NO" ]
        then 
            break
        fi   
done



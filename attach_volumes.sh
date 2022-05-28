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


#### This counts the number of instances in instance_ids.txt
inst_count=$(sed -n '$=' TEXTFILES/instance_ids.txt)


# variables to configure loop
floor=0
instance_count=$inst_count


while [ $floor -lt $instance_count ]
do 
    ((floor++))
    instance_ids=$(sed -n ${floor}p TEXTFILES/instance_ids.txt)
    volume_ids=$(sed -n ${floor}p TEXTFILES/ENCRYPTED_VOLUMES/encrypted_volumes.txt)

#### MAIN COMMAND THAT ATTACHES VOLUME TO INSTANCE
    aws ec2 attach-volume --volume-id $volume_ids --instance-id $instance_ids --device "//dev\xvda"

done


















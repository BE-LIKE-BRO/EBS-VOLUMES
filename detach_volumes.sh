#!/bin/bash

#prompts to confirm that you're aware of action about to be executed 
while true
do
    read -p "YOU ARE ABOUT TO DETACH VOLUMES. Type CONTINUE to proceed(ALL CAPS): " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done


#### This counts the number of volumes in the unencrypted_volumes.txt
volume_count=$(sed -n '$=' TEXTFILES/unencrypted_volumes.txt)

# variables to configure loop
floor=0
unencrypted_volumes_count=$volume_count


#### This detaches unencrypted volumes from their respective instances
while [ $floor -lt $unencrypted_volumes_count ]
do 
    ((floor++))
    for volume_ids in `sed -n ${floor}p TEXTFILES/unencrypted_volumes.txt`; do aws ec2 detach-volume --volume-id $volume_ids ;done

done







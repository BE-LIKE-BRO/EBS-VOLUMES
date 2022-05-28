#!/bin/bash

#### This prompts to confirm that you're aware of action about to be executed 
while true
do
    read -p "YOU ARE ABOUT TO CREATE ENCRYPTED VOLUMES. Type CONTINUE to proceed(ALL CAPS): " continue
    if [ "$continue" == "CONTINUE" ]
    then 
        break
    else
        echo "please type 'CONTINUE' in ALL CAPS to proceed"
    fi  
done


#### THIS COUNTS THENUMBER OF SNAPSHOTS IN SNAPSHOTS.TXT FILE
snapshots_count=$(sed -n '$=' TEXTFILES/SNAPSHOTS/snapshots.txt)

# variables to configure loop
floor=0
snap_count=$snapshots_count

#### CONFIRMS AVAILABILITY ZONE TO CREATE VOLUMES IN 
read -p "input Availability_Zone for all new volumes " AZ

#### THIS CREATES ENCRYPTED VOLUMES
while [ $floor -lt $snap_count ]
do 
    ((floor++))
    for snap_ids in `sed -n ${floor}p TEXTFILES/SNAPSHOTS/snapshots.txt`; do aws ec2 create-volume --availability-zone $AZ --snapshot-id $snap_ids --encrypted ;done

done
















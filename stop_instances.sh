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


#### This counts the number of instances in instance_ids.txt
inst_count=$(sed -n '$=' TEXTFILES/instance_ids.txt)


#### variables to configure loop
floor=0
instance_count=$inst_count


#### This shuts down instances

while [ $floor -lt $instance_count ]
do 
    ((floor++))
    for instance_ids in `sed -n ${floor}p TEXTFILES/instance_ids.txt`; do aws ec2 stop-instances --instance-ids $instance_ids ;done

done

#### Notifies Program completion on terminal
echo "---------------------------------"
echo "---------------------------------"
echo "DONE! ALL INSTANCES STOPPED!"



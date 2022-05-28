#!/bin/bash

#### Confirming the aws environment to work on
echo "confirm aws environment to work on"
echo "---------------------------------"
echo "---------------------------------"
aws configure

#### Creates directory to store exported files
mkdir TEXTFILES

#### Compiling all unencrypted volumes and Instanes IDs in seperate files 

echo "compiling unencrypted volumes' IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=false" --query 'Volumes[*].Attachments[].{VolumeID:VolumeId}' > TEXTFILES/unencrypted_volumes.txt
echo "---------------------------------"
echo "---------------------------------"
echo "compiling instance IDs into file..."
echo "---------------------------------"
echo "---------------------------------"
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=false" --query 'Volumes[*].Attachments[].{InstanceID:InstanceId}' > TEXTFILES/instance_ids.txt
echo "DONE!"
echo "Unencrypted volumes IDs compiled in TEXTFILES/unencrypted_volumes.txt' file. "
echo "Instance IDs compiled in TEXTFILES/instance_ids.txt "
#!/bin/bash
#connect to aws environment
aws configure
#Compiling all unencrypted volumes in a file
echo "compiling unencrypted volumes' IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=false" --query 'Volumes[*].Attachments[].{VolumeID:VolumeId,InstanceID:InstanceId}' > unencrypted_volumes.txt
echo "List of all unencrypted volumes compiled in file unencrypted_volumes.txt'. " 

#!/bin/bash
#Compiling all encrypted volumes in a file
echo "compiling encrypted volumes' IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=true" --query 'Volumes[*].{VolumeID:VolumeId, SnapshotId:SnapshotId}' > encrypted_volumes.txt
echo "List of all encrypted volumes compiled in file encrypted_volumes.txt'. " 


#!/bin/bash
#Compiling all encrypted volumes in a file
echo "compiling encrypted volumes' IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=true" --query 'Volumes[*].{VolumeID:VolumeId, SnapshotId:SnapshotId}' > encrypted_volumes.txt
echo "DONE!"
echo "Encrypted volumes IDs compiled in encrypted_volumes.txt' file. " 


#!/bin/bash

#### Creates directory to store exported files
mkdir TEXTFILES/ENCRYPTED_VOLUMES 


#### Compiling all encrypted volumes in a file
echo "compiling encrypted volumes' IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=true" --query 'Volumes[*].{VolumeID:VolumeId}' > TEXTFILES/ENCRYPTED_VOLUMES/encrypted_volumes.txt
echo "---------------------------------"
echo "---------------------------------"

#### Compiles snapshot IDs encrypted volumes were created from
echo "compiling encrypted volumesnap IDs in file... " 
aws ec2 describe-volumes --output text --filters "Name=encrypted, Values=true" --query 'Volumes[*].{SnapshotId:SnapshotId}' > TEXTFILES/ENCRYPTED_VOLUMES/encrypted_volumesnaps.txt
echo "DONE!"
echo "Encrypted volumes IDs compiled in ENCRYPTED_VOLUMES/encrypted_volumes.txt file. " 
echo "Encrypted volume_snap IDs compiled in ENCRYPTED_VOLUMES/encrypted_volumesnaps.txt file. " 


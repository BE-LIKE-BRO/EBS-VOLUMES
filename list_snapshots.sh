#!/bin/bash

#### Creates directory to store exported files
mkdir TEXTFILES/SNAPSHOTS

#### Compiling all snapshots in a file
echo "compiling snapshots IDs in file... " 
aws ec2 describe-snapshots --output text --owner-ids self --filters Name=status,Values=completed --query 'Snapshots[*].{SnapshotId:SnapshotId}' > TEXTFILES/SNAPSHOTS/snapshots.txt
echo "---------------------------------"
echo "---------------------------------"
echo "compiling snap_volume IDs into file..."
aws ec2 describe-snapshots --output text --owner-ids self --filters Name=status,Values=completed --query 'Snapshots[*].{VolumeID:VolumeId}' > TEXTFILES/SNAPSHOTS/snapvolumes.txt
echo "---------------------------------"
echo "---------------------------------"
echo "DONE!"
echo "Snapshots IDs compiled in SNAPSHOTS/snapshots.txt file"
echo "Snapshots IDs compiled in SNAPSHOTS/snapvolumes.txt file"



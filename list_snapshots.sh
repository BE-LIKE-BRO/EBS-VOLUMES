#!/bin/bash
#Compiling all snapshots in a file
echo "compiling snapshots IDs in file... " 
aws ec2 describe-snapshots --output text --owner-ids self --filters Name=status,Values=completed --query 'Snapshots[*].{SnapshotId:SnapshotId, VolumeID:VolumeId}' > snapshots.txt
echo "DONE!"
echo "Snapshots IDs compiled in snapshots.txt file"


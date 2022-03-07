#!/bin/bash
#Compiling all snapshots in a file
echo "compiling snapshots IDs in file " 
aws ec2 describe-snapshots --output text --query 'Snapshots[*].Attachments[*].{ID:SnapshotId}' > snapshots.txt

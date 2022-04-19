# Incomplete Project to fully automate the encryption of EBS volumes already attached to instances 

PREREQUISITES:
1. Excel file with columns from left to right; EC2-instances, Unencrypted-volume-ID, Snapshot-ID, Encrypted-volumed-ID
   --- This is to allow for easy visualization and retrieval of details
2.  Need to match respective details to their respective columns and rows


POINTERS:
1. PLS COMPLETELY FINISH ONE PHASE BEFORE MOVING ONTO THE NEXT TO MINIMIZE CHANCE OF ERROR
2. Snapshot.txt details are arranged in reversed order compared to unencrypted_volumes.txt 
   This info should help in matching corresponding details faster.
3. encrypted_volumes.txt is arranged in the same order as unencrypted_volumes.txt file
4. These are IDs you'll find in the following files
 - unencrypted_volumes.txt   ------- ec2 instance ID && attached unencrypted volume IDs
 - snapshots.txt  ------------------ snapshot ID && unecrypted volume ID
 - encrypted_volumes.txt  ---------- snapshot ID && encrypted volume ID 
5. Please confirm environment availability zone before creating volumes
6. Confirm storage root device name (e.g /dev/xvda) before attaching new encrypted volumes
7. Edit root device name in attach_volumes.sh


EXECUTION PROCESS
1. list_unencrypted_volumes_ids
2. create_snapshots using details from unencrypted_volumes.txt
3. list_snapshots
4. create_encrypted_volumes with snapshot.txt details
5. list_encrypted_volumes
6. stop_instances
7. detach_volumes
8. attach_volumes
9. start_instances







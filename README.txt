PREREQUISITES:
1. Excel file with columns from left to right; EC2-instances, Unencrypted-volume-ID, Snapshot-ID, Encrypted-volumed-ID
   --- This is to allow for easy visualization of details
2.  Need to match respective details to their respective columns and rows


POINTERS:
1. PLS COMPLETELY FINISH ONE PHASE BEFORE MOVING ONTO THE NEXT TO MINIMIZE CHANCE OF ERROR
2. Snapshot.txt details are arranged in reversed order compared to unencrypted_volumes.txt 
   This info should help in matching corresponding details faster.
3. encrypted_volumes.txt is arranged in the same order as unencrypted_volumes.txt file
4. These are IDs you'll find in the following files
 - unencrypted_volumes.txt   ------- ec2 instance ID && attached unencrypted volume
 - snapshots.txt  ------------------ snapshot ID && unecrypted volume ID
 - encrypted_volumes.txt  ---------- snapshot ID && encrypted volume ID 


EXECUTION PROCESS
1. list_unencrypted_volumes_ids
2. create_snapshots using details from unencrypted_volumes.txt
3. list_snapshots
4. create_encrypted_volumes with snapshot.txt details
5. list_encrypted_volumes





# Automated encryption of already attached EBS volumes 
This is a bash script project which fully automates the entire process of encryptiong unencrypted volumes that are currently attached to a running ec2 instance. The automation steps/scripts were seperated to allow human validation and control of the workflow.
The scripts are named same as the execution process for easy identification

PREREQUISITES:
1. aws cli installed on computer
2. aws user account with ec2 action privileges 

EXECUTION PROCESS
1. list_unencrypted_volumes
2. create_snapshots 
3. list_snapshots
4. create_encrypted_volumes  
5. list_encrypted_volumes
6. stop_instances 
7. detach_volumes
8. attach_volumes
9. start_instances



POINTERS:
1. PLS COMPLETELY FINISH ONE PHASE BEFORE MOVING ONTO THE NEXT TO MINIMIZE CHANCE OF ERROR
2. These are IDs you'll find in the following files
 - unencrypted_volumes.txt   ------- ec2 instance ID && attached unencrypted volume IDs
 - snapshots.txt  ------------------ snapshot ID && unecrypted volume ID
 - encrypted_volumes.txt  ---------- snapshot ID && encrypted volume ID 
3. Please confirm environment availability zone before creating volumes
4. Confirm storage root device name (e.g /dev/xvda) before attaching new encrypted volumes
5. Edit root device name in attach_volumes.sh








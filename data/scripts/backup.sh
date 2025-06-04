echo "Freezing the system..."
## freeze the system before backup
# Use the iris terminal command to execute the freeze operation
# The command will run the ExternalFreeze method from the Backup.General class
# The login script is used to authenticate the operation
# The exit codes are checked to determine the status of the freeze operation
# Exit code 5 indicates the system is frozen, 3 indicates failure
iris terminal iris -U%SYS "##Class(Backup.General).ExternalFreeze()" < /data/scripts/login.key
## check if the freeze was successful
## The exit code is captured and checked
status=$?
if [ $status -eq 5 ]; then
    echo "SYSTEM IS FROZEN"
    ## backup all the IRIS.DAT files via operating system commands  
    echo "Backing up IRIS.DAT files..."
    rm -rf /volumes/backup/IRISAPP*
    ## add log file to trace the status of the backup 
    mkdir -p /volumes/backup
    if [ ! -d /volumes/backup ]; then
        echo "Backup directory does not exist, creating it..."
        mkdir -p /volumes/backup
    fi
    ## echo "Creating backup log file..."
    "Backup started at $(date)" >> /volumes/backup/backup.log
    cp -r /volumes/IRIS/mgr/IRISAPP_CODE* /volumes/backup
    ## check if the backup was successful
    status=$?
    if [ $status -eq 0 ]; then
        echo "BACKUP SUCCESSFUL"
        echo "Backup completed at $(date)" >> /volumes/backup/backup.log
        echo "Backup size: $(du -sh /volumes/backup/IRISAPP_CODE* | awk '{print $1}')" >> /volumes/backup/backup.log
    else
        echo "BACKUP FAILED"
        echo "Error code: $status" >> /volumes/backup/backup.log
    fi
    # Now unfreeze the system
    echo "Unfreezing the system..."
    ## Use the iris terminal command to execute the unfreeze operation  
    # The command will run the ExternalThaw method from the Backup.General class
    # The login script is used to authenticate the operation
    # The exit codes are checked to determine the status of the unfreeze operation
    # Exit code 5 indicates the system is still frozen, 3 indicates failure
    # Exit code 0 indicates success
    iris terminal iris -U%SYS "##Class(Backup.General).ExternalThaw()" < /data/scripts/login.key

    ## check if the unfreeze was successful
    status=$?
    ## log the status of the unfreeze operation
    echo "Unfreeze operation status: $status at $(date)" >> /volumes/backup/backup.log
    if [ $status -eq 5 ]; then
        echo "SYSTEM UNFROZEN SUCCESSFULLY" 
        echo "Backup process completed successfully with status $status at $(date)" >> /volumes/backup/backup.log
    elif [ $status -eq 3 ]; then
        echo "SYSTEM UNFREEZE FAILED"
        echo "Backup aborted due to unfreeze failure." >> /volumes/backup/backup.log
        echo "Please check the backup log for more details in /volumes/backup/backup.log"
        echo "Error code: $status" >> /volumes/backup/backup.log     
    fi  
elif [ $status -eq 3 ]; then
    echo "SYSTEM FREEZE FAILED $(date)" >> /volumes/backup/backup.log
    echo "Backup aborted due to freeze failure."
    echo "Please check the backup log for more details in /volumes/backup/backup.log"
    echo "Error code: $status" >> /volumes/backup/backup.log
else
    echo "Unexpected error occurred during freeze operation $(date)" >> /volumes/backup/backup.log 
    echo "Backup aborted."
    echo "Please check the backup log for more details in /volumes/backup/backup.log"
    echo "Error code: $status" >> /volumes/backup/backup.log
    exit $status
fi


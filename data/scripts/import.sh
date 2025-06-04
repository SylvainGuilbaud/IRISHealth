## import and compile source files into the IRIS database via the iris terminal command
iris terminal iris "##class(%SYSTEM.OBJ).Import(\"/app/src/\",\"ck\")" < /data/scripts/login.key
## check if the import was successful
status=$?
if [ $status -eq 0 ]; then
    echo "IMPORT SUCCESSFUL"
    echo "Import completed at $(date)" >> /data/scripts/import.log
else
    echo "IMPORT FAILED"
    echo "Error code: $status at $(date)" >> /data/scripts/import.log

fi
## log the status of the import operation
echo "Import operation status: $status at $(date)" >> /data/scripts/import.log
if [ $status -eq 0 ]; then
    echo "Import process completed successfully with status $status at $(date)" >> /data/scripts/import.log
else
    echo "Import process failed with status $status at $(date)" >> /data/scripts/import.log
    echo "Please check the import log for more details in /data/scripts/import.log"
fi

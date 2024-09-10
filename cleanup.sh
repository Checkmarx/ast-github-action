#!/bin/bash

cancelId=(`grep -E '"(ID)":"((\\"|[^"])*)"' ./log/output.log | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

if [ -z "$cancelId" ]
then 
  echo "Scan not created. Terminating job."
  
else 
  echo "Canceling scan with ID:" $cancelId
  /app/bin/cx scan cancel --scan-id "${cancelId}"
fi


exitCode=$?
echo "Program exits with code: " $exitCode

if [ $exitCode -eq 0 ]
then
  echo "Job terminated successfully"

else
  echo "Job Failed"
  exit $exitCode
fi
#!/bin/bash

cancelId=(`grep -E '"(ID)":"((\\"|[^"])*)"' ./output.log | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)
echo "Cancelling scan with ID:" $cancelId

/app/bin/cx scan cancel --scan-id "${cancelId}" --debug

exitCode=$?
echo "Program exits with code: " $exitCode

if [ $exitCode -eq 0 ]
then
  echo "Scan cancelled successfully"

else
  echo "Scan cancelation Failed"
  exit $exitCode
fi
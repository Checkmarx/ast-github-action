#!/bin/bash

cat /tmp/output.file
/app/bin/cx scan cancel --scan-id
exitCode=$?

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi

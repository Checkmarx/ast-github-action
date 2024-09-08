#!/bin/bash

# Define the output file location where the non-root user has write access
output_file=/app/output.log

# Extract the scan ID from the output log
cancelId=(`grep -E '"(ID)":"((\\"|[^"])*)"' $output_file | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

# Check if the scan ID exists
if [ -z "$cancelId" ]; then
  echo "Scan not created. Terminating job."
else 
  echo "Canceling scan with ID: $cancelId"
  # Cancel the scan using the cx CLI
  /app/bin/cx scan cancel --scan-id "${cancelId}"
fi

# Capture the exit code from the cancellation command
exitCode=$?
echo "Program exits with code: $exitCode"

# Check if the cancellation was successful
if [ $exitCode -eq 0 ]; then
  echo "Job terminated successfully"
else
  echo "Job Failed"
  exit $exitCode
fi

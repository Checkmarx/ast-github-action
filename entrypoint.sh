#!/bin/bash

# ------------------------------------------------------
# Main Entrypoint Orchestrator
# ------------------------------------------------------

# 1. Setup Global Variables
export output_file=./output.log
echo "Server URL: $GITHUB_SERVER_URL"

# 2. Determine Environment (Cloud vs On-Prem)
if [ "$GITHUB_SERVER_URL" = "https://github.com" ]; then
    echo "Detected GitHub Cloud"
    export IS_CLOUD=true
else
    echo "Detected GitHub Enterprise Server"
    export IS_CLOUD=false
fi

# A. Multi-Registry Authentication
source /app/scripts/auth.sh

# B. Scan Execution
source /app/scripts/scan.sh

# C. PR Decoration
source /app/scripts/pr_decoration.sh

# D. Results Reporting
source /app/scripts/results.sh

# 4. Final Exit Handling
if [ $exitCode -eq 0 ]; then
    echo "Scan completed successfully."
else
    echo "Scan failed."
    exit $exitCode
fi
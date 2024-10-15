#!/bin/bash

# Path to the file you want to check
FILE="PSUC.exe.pat"

# Function to perform an action if the file exists
perform_action() {
    mv PSUC.exe PSUC.exe.bak && mv PSUC.exe.pat PSUC.exe
}

# Check if the file exists
if [ -e "$FILE" ]; then
    perform_action
    else
    fi

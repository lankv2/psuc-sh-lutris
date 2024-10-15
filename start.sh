#!/bin/bash

# Path to the executable you want to run
EXE_PATH="PSUC.exe" # Change this to the actual path

# Command to start the process (modify as needed)
COMMAND="env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/199"

# Start the process in the background
$COMMAND &

# Get the PID of the last background command
PROCESS_PID=$!

# Wait for the process to terminate
wait $PROCESS_PID
EXIT_STATUS=$?

# Function to check if the .exe is still running
is_exe_running() {
    pgrep -f "$EXE_PATH" > /dev/null
}

# Check if the process has terminated
if is_exe_running; then
    echo "The executable is still running."
else
    echo "The executable has terminated."
fi

# Path to the file you want to check
FILE="PSUC.exe.pat"

# Function to perform an action if the file exists
perform_action() {
    echo "File $FILE exists. Performing action..."
    mv PSUC.exe PSUC.exe.bak && mv PSUC.exe.pat PSUC.exe
}

# Check if the process exited successfully and if the file exists
if [ $EXIT_STATUS -eq 0 ]; then
    if [ -e "$FILE" ]; then
        perform_action
    else
        echo "File $FILE does not exist."
    fi
else
    echo "Process terminated with exit status $EXIT_STATUS."
fi
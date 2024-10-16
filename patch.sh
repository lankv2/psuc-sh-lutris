#!/bin/bash

# Moving to game directory
cd drive_c/'Program Files (x86)'/'Phantasy Star Universe Clementine'

# Setting patched exe path as a variable
FILE="PSUC.exe.pat"

# Defining function to replace original exe with the patched one
replace_exe() {
    mv PSUC.exe PSUC.exe.bak && mv PSUC.exe.pat PSUC.exe
}

# Checking if the patched exe exists
if [ -e "$FILE" ]; then

# Calling function
replace_exe

# Sleep for x amount of time
sleep 2

# Restarting Game
env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/199

# Close script
fi

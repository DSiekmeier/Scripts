#!/bin/bash

# AUTHOR
#     Dennis Siekmeier  -  www.dsiekmeier.de
#
# DESCRIPTION
#     This script checks the integrity of tar.gz files by passing them to tar
#     and try to compress the respective contained files
#
# USAGE
#     ./check_archives.sh [folder_to_check]
#     If you omit the folder when calling the script the current one is used.
#
# HISTORY
#     24-04-2024: initial release

# COMMAND LINE PARAMETERS
FOLDER=$1

if [ -z "$FOLDER" ]; then
  FOLDER="."
fi

echo "Checking files in folder: $FOLDER"

for file in "$FOLDER"/*.tar.gz; do 
    if [ -f "$file" ]; then 
        tar -xzf "$file" -O > /dev/null
        echo "$file: " "$?"
    fi 
done

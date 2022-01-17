#!/bin/bash

# AUTHOR
#     Dennis Siekmeier  -  www.dsiekmeier.de
#
# DESCRIPTION
#     This is a very basic script to compress and encrypt folders recursivly
#     and can be used for full backups. Some configuration can be done by the
#     values of the variables below. A lot of things can be improved though...
#     Use at your own risk.
#
# USAGE
#     ./create_backup_full.sh <FolderToCompress>
#     The script will ask for a password which is used by 7z to encrypt the
#     compressed archive.
#
# HISTORY
#     17-01-2022: check if configured archiver exists
#     30-01-2019: changed date format for better sorting
#     27-12-2018: initial release

# COMMAND LINE PARAMETERS
SRC=$1
SRCRAW=${1%/}

# SETTINGS
ARCHIVER=7z
COMMAND=a
SWITCH=-mhe=on
DATE=`date "+%Y-%m-%d"`

# CHECK REQUIREMENT
if ! command -v $ARCHIVER &> /dev/null
then
    echo "Error: archiver not found. Change command or install" $ARCHIVER
    exit
fi

# USER INPUT
echo -n "Passwort: "
read -s PWD 

# CALL TO ARCHIVER
$ARCHIVER $COMMAND $SWITCH -p$PWD "$SRCRAW"_$DATE.7z "$SRC"

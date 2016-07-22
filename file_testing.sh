#!/bin/bash

# -b filename         Block special file
# -c filename         Special character file
# -d directoryname    Check for directory existence
# -e filename         Check for file existence
# -f filename         Check for regular file existence not a directory
# -G filename         Check if file exists and is owned by effective group ID.
# -g filename         true if file exists and set-group-id
# -k filename         Stricky bit
# -L filename         symbolic link
# -O filename         True if file exists and is owned by the effective user id.
# -r filename         Check if file is a readable
# -S filename         Check if file is socket
# -s filename         Check if file is nonzero size
# -u filename         Check if file set-ser-id bit is set
# -w filename         Check if file is writable
# -x filename         Check if file is executable

FILE=$0

if [ -e $FILE ]; then
    echo "$FILE exists"
fi


if [ -r $FILE ]; then
    echo "$FILE can be readable."
else
    echo "$FILE can not be readable"
fi

if [ -w $FILE ]; then
    echo "$FILE can be writable."
else
    echo "$FILE can not be writable."
fi


if [ -x $FILE ]; then
    echo "$FILE can be executable."
else
    echo "$FILE can not be executable."
fi

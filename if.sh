#!/bin/bash

directory="/tmp"

if [ -d $directory ]; then
    echo "Directory exists."
else
    echo "Directory does not exist."
fi

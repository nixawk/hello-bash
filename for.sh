#!/bin/bash

DIR="/tmp"

function is_executable() {
    if [ -x $1 ]; then
        echo "$1 is executable."
    else
        echo "$1 is not executable"
    fi
}

for f in $(ls $DIR); do
    is_executable $f
done

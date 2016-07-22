#!/bin/bash

COUNT=6

while [ $COUNT -gt 0 ]; do
    echo "Value of count is : $COUNT"
    ((COUNT--))  # Equal to: let COUNT=COUNT-1
done

DIR="/bin"
ls "$DIR" | while read file; do
  echo "File: $DIR/$file"
done

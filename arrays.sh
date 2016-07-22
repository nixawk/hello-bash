#!/bin/bash

# Declare array with 4 elements
ARRAY=('Debian Linux' 'Redhat Linux' 'Ubuntu Linux')

# Get number of elements in the array
ELEMENTS=${#ARRAY[@]}

# Echo each element in array
for ((i=0; i<$ELEMENTS; i++)); do
    echo ${ARRAY[${i}]}
done

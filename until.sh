#!/bin/bash

COUNT=0

until [ $COUNT -gt 6 ];do
    echo "Value of count is : $COUNT"
    ((COUNT++))   # let COUNT=COUNT+1
done

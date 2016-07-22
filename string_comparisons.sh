#!/bin/bash

#  =        equal
#  !=       not equal
#  <        less then
#  >        greater than
#  -n s1    string s1 is not empty
#  -z s1    string s1 is empty

S1="HelloWorld"
S2="HelloBash"

if [ $S1 = $2 ];then
    echo "Both strings are equal"
else
    echo "Strings are NOT equal"
fi

if [ -n $S1 ] && [ -n $S2 ]; then
    echo "Both strings are not empty."
fi

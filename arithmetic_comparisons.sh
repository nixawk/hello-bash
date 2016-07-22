#!/bin/bash

# -lt  -  <
# -gt  -  >
# -le  -  <=
# -ge  -  >=
# -eq  -  ==
# -ne  -  !=

NUM1=2
NUM2=3

if [ $NUM1 -eq $NUM2 ]; then
    echo "Both Values are equal"
else
    echo "Values are not equal"
fi

NUM3=4
NUM4=4

if [ $NUM3 == $NUM4 ]; then
    echo "Both Values are equal"
else
    echo "Values are not equal"
fi

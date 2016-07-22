#!/bin/bash

PS3="Choose a word : "

select word in "linux" "bash" "shell"; do
    echo "The word you have selected is : $word"
    break
done

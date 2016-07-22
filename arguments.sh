#!/bin/bash

# use predefined variables to access passed arguments
# echo argument to the shell
echo $1 $2 $3 ' -> echo $1 $2 $3'

# we can also store arguments for bash command line in special array
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ' -> args=("$@"); echo ${args[0]} ${args[1]} ${args[2]}'

# use $@ to print out all arguments at once
echo $@ ' -> $@'

# use $# variable to print out
# number of arguments passed to the bash script
echo Number of arguments passwd: $# ' -> echo Number of arguments passwd: $# '

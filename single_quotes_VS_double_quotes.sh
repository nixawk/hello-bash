#!/bin/bash

# Single quotes in bash will suppress special meaning of every meta characters.
# Therefore meta characters will be read literally.

VAR="BASH Variable"

echo $VAR
echo "$VAR"   # output: BASH Variable
echo '$VAR'   # output: $VAR


#  \a     -- alert
#  \b     -- backspace
#  \e     -- an escape character
#  \f     -- form feed
#  \n     -- newline
#  \r     -- carriage return
#  \t     -- horizontal tab
#  \v     -- vertical tab
#  \\     -- backslash
#  \'     -- single quote
#  \nnn   -- octal value of characters
#  \xnn   -- hexadecimal value of characters

echo -e "\x31\x32\x33"  # output: 123

#!/bin/bash

STRING="HelloWorld"
ARRAY=(one two three)

echo ${STRING}    # equal to echo $STRING

## Length
echo ${#STRING}   # output $STRING length
echo ${#ARRAY}    # output $ARRAY length


## Substitution

# http://www.tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#chap_12
# ${VAR:-WORD}
# If VAR is not defined or null, the expansion of WORD is substituted; otherwise the value of VAR is substituted.
echo ${VAR:-astring}
echo ${STRING:-Bash}

# This form is often used in conditional tests, for instance in this one:
# [ -z "${COLUMNS:-}" ] && COLUMNS=80

### Removing substrings
# ${VAR:OFFSET:LENGTH}
# The LENGTH parameter defines how many characters to keep, starting from the first character after the offset point.
# If LENGTH is omitted, the remainder of the variable content is taken:
echo ${STRING:5}
echo ${STRING:5:2}

# ${VAR#WORD}
# ${VAR##WORD}

echo ${ARRAY[*]#one}
echo ${ARRAY[*]##t}

## Replacing parts of variable names
# ${VAR/PATTERN/STRING} or ${VAR//PATTERN/STRING}

echo ${STRING/World/Bash}
echo ${STRING//World/Bash}

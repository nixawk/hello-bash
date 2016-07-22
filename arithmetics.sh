#!/bin/bash

echo "---- let ----"
let ADDITION=1+2
echo "1 + 2 = $ADDITION"

let SUBTRACTION=4-3
echo "4 - 3 = $SUBTRACTION"

let MULTIPLICATION=2*3
echo "2 * 3 = $MULTIPLICATION"

let DIVISION=4/2
echo "4 / 2 = $DIVISION"

let MOD=4%3
echo "4 % 3 = $MOD"

let POWER_OF_TWO=2**2
echo "2 ** 2 = $POWER_OF_TWO"


echo "---- Bash Arithmetic Expansion ----"
echo "1 + 2 = $((1+2))"
echo "4 - 3 = $((4-3))"
echo "2 * 3 = $((2*3))"
echo "4 / 2 = $((4/2))"
echo "4 % 3 = $((4%3))"
echo "2 ** 2 = $((2**2))"


echo "---- Declare ----"
echo "Please enter two number \c"
read n1 n2
declare -i result
result=$n1+$n2
echo "result is: $result"

result=2#1001
echo "binary: 1001 -> decimal: $result"

result=8#11
echo "octal: 11 -> decimal: $result"

result=16#F
echo "hex: F -> decimal: $result"

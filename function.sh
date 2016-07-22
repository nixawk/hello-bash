#!/bin/bash

# Functions either use the syntax
  # function FUNCTION {COMMANDS;}
  # or
  # FUNCTION(){COMMANDS;}

function hello() {
    echo "hello : $1"
}

hello "world"
hello "bash"

#!/bin/bash

STRING="Global Var, $(date +%Y%m%d)!"  ## STRING is a global variable
echo $STRING

function local_var {
    ## Define a local variable
    local VAR="Local Var, $(date +%Y%m%d)!"
    echo $VAR
}

local_var  # local_var() will make an error.

#!/bin/bash

function scan {
    PORTS=(80 110 443 8080)
    NUM=${#PORTS[@]}
    for ((i=0; i<$NUM; i++)); do
        nc -vz -w 3 $1 ${PORTS[${i}]}
    done
}

if [ -z $1 ]; then
    echo "[+] Usage: $0 192.168.1.1"
    exit 1
else
    scan $1
fi

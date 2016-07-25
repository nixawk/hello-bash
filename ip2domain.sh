#!/bin/bash

IP_FILE="$1"

if [ ! -e "$IP_FILE" ]; then
    echo "[*] Usage: $0 ip.txt"
    exit 1
fi

for ip in $(cat $IP_FILE); do
	data=$(host $ip | grep " domain name pointer " | cut -d" " -f5)
	echo "$ip: $data"
done

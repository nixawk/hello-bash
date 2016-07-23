#!/bin/bash

# ping bulk
# offensive security
function ping_host {
    ip_prefix=$(echo $1 | cut -d "." -f 1,2,3)
    seq -f "$ip_prefix.%g" 1 255 | while read ip; do
        ping_resp=$(ping -c 2 -t 2 $ip 2>/dev/null | grep " bytes from " | cut -d ":" -f 1 | sort -u)
        if [ ${#ping_resp} -ne 0 ]; then
            echo "success : $ip"
        else
            echo "failed  : $ip"
        fi
    done
}

if [ -z $1 ]; then
    echo "[+] Usage: $0 192.168.1.1"
    exit 1
else
    ping_host $1
fi

#!/bin/bash

function dns_axfr {
    domain=$1
    host -t ns $domain | while read nameserver; do
        nameserver=$(echo  $nameserver | cut -d" " -f4)
        echo "$domain: $nameserver - [zone transfer]"
        # host -t axfr $domain $nameserver
        host -l $domain $nameserver | grep "has address"
    done

}

if [ -z $1 ]; then
    echo "[*] Simple Zone Transfer script"
    echo "[*] Usage: $0 <domain name>"
    exit 0
fi

dns_axfr $1

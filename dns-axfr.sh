#!/bin/bash

function dns_axfr {
    domain=$1
    for nameserver in `dig $domain ns +short`; do host -l $domain $nameserver; done
}

if [ -z $1 ]; then
    echo "[*] Simple Zone Transfer script"
    echo "[*] Usage: $0 <domain name>"
    exit 0
fi

dns_axfr $1

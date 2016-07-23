#!/bin/bash

DOMAIN_FILE="$1"

if [ ! -e "$DOMAIN_FILE" ]; then
    echo "[*] Usage: $0 domains.txt"
    exit 1
fi

for domain in $(cat $DOMAIN_FILE); do
  host $domain | grep " has address" | while read dns_record; do
      echo -e "$domain : \c"
      echo -e "${dns_record/ has address / : }"
	done
done

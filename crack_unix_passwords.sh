#!/bin/bash

# How to crack unix passwords ?
# https://linuxconfig.org/password-cracking-with-john-the-ripper-on-linux
# http://www.cyberciti.biz/faq/unix-linux-password-cracking-john-the-ripper/

# How to run the crack script ?
# $ bash crack_unix_hash.sh /etc/passwd /etc/shadow /tmp/wd.txt

if [ ! -e "$(which john)" ]; then
    echo "[!] Please install johntheripper."
    exit 1
fi

if [ "${#@}" -lt 3 ]; then
    echo "[*] Usage: $0 /etc/passwd /etc/shadow /path/to/wordlists"
    exit 1
fi

PASSWD_FILE="$1"
SHADOW_FILE="$2"
WDLIST_FILE="$3"

if [ ! -e "$PASSWD_FILE" ]; then
    echo "[*] Failed to load a passwd file : $PASSWD_FILE"
    exit 1
fi

if [ ! -e "$SHADOW_FILE" ]; then
    echo "[*] Failed to load a shadow file : $SHADOW_FILE"
    exit 1
fi

HASH_FILE=$(mktemp)
unshadow $PASSWD_FILE $SHADOW_FILE > $HASH_FILE

if [ ! -e "$HASH_FILE" ] ; then
    echo "[*] Failed to create a password-hash file : $HASH_FILE"
    exit 1
fi

if [ ! -e "$WDLIST_FILE" ]; then
    echo "[*] Failed to load a wordlist file : $WDLIST_FILE"
    exit 1
fi

echo "PASSWORD: $PASSWD_FILE"
echo "SHADOW  : $SHADOW_FILE"
echo "WORDLIST: $WDLIST_FILE"
echo "HASH    : $HASH_FILE"

dos2unix "$HASH_FILE"
dos2unix "$WDLIST_FILE"
john --format=sha512crypt --wordlist="$WDLIST_FILE" "$HASH_FILE"

#!/bin/bash

# If you want to test more times, please update the code.

APKFILE=$1
KEYNAME="androidtesting"
ALIASNAME="at"

[[ -z "$APKFILE" ]] && echo "[*] Usage: $0 <apkfile>" && exit 0

echo "[+] 1. Generate a new key for android apk sign"
keytool -genkey -v -keystore $KEYNAME -alias at -keyalg RSA -keysize 2048 -validity 1000

echo "[+] 2. Sign android apk"
jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore "$KEYNAME" "$APKFILE" "$ALIASNAME"

echo "[+] 3. Verify sign result"
jarsigner -verify -verbose "$APKFILE"

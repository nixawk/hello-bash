#!/bin/bash

# Prepare:
# 1. Smartphone or Android Lab
# 2. Install adb tools
# 3. Connect to android lab with adb tools

# ## How to view android content ?

# $ adb install catch.apk
# $ adb shell pm path com.threebanana.notes
# $ adb pull /path/to/catch.apk .
# $ apktool d catch.apk
# $ grep -Rih -o "content://[^\"]*" ./ | sort -u
# $ adb shell content query --uri 'content://xxx/xxx/xxx'

apkfile=$1

if [ -z "$apkfile" ]; then
  echo -e "[*] Usage: $0 <apkfile>"
  exit 0
fi

echo "[*] apktool decode <$apkfile>"
apktool d "$1" -o output/

echo "[*] enum all content strings"
contents=$(grep -Rih -o "content://[^\"]*" ./output/ | sort -u)
for content in $contents; do
    echo -e "\n[*] Enum <$content>"
    adb shell content query --uri "$content"
done

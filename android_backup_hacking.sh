#!/bin/bash

# Android Backup and Restore
# $ adb backup -f backup.rb com.xxx.xxx
# $ adb restore backup.ab

# How to prevent Backup Vulnerability ?
# AndroidManifest.xml: android:allowBackup="false"

# http://resources.infosecinstitute.com/android-hacking-security-part-15-hacking-android-apps-using-backup-techniques/

# 1. android backup : [HEADER][CONTENT]
# 2. remove header  :         [CONTENT]
# 3. make changes   :         [MODIFIED CONTENT]
# 4. get the header : [HEADER]
# 5. Append changes : [HEADER][MODIFIED CONTENT]

# Download abe.jar
# http://sourceforge.net/projects/adbextractor/

androidbackup=$1
abe="abe.jar"
if [ -z "$androidbackup" ]; then
    echo "[*] Usage: $0 <android_backup_file>"
    exit 0
fi

if [ ! -e "$abe" ]; then
    echo "[*] download a android backup tool called $abe"
    wget -c "https://sourceforge.net/projects/adbextractor/files/abe.jar/download" && mv download "$abe"
fi

echo "[*] hack android backup $androidbackup"
java -jar abe.jar unpack "$androidbackup" "$androidbackup.tar"
tar xvf "$androidbackup.tar" && rm "$androidbackup.tar"
read -p "[*] waiting all jobs finished...." _pause
ls -l
read -p "[*] destination dir to be packed: " destination_dir
tar cvf "$androidbackup.tar" "$destination_dir/"
java -jar abe.jar pack "$androidbackup.tar" "new-$androidbackup"
echo "[*] new backup: new-$androidbackup"

# openssl:Error: 'zlib' is an invalid command.
# http://stackoverflow.com/questions/29830981/error-zlib-is-an-invalid-command

# adb backup -f backup.ab $package
# dd if=$package bs=24 skip=1 | openssl zlib -d > backup.tar
# tar -tf backup.tar > backup.list && cat backup.list
# tar xvf backup.tar

# read -p "waiting all jobs finished...." _pause

# star -c -v -f newbackup.tar -no-dirslash list=backup.list
# dd if=$package bs=24 count=1 > newbackup.ab
# openssl zlib -in newbackup.tar >> newbackup.ab

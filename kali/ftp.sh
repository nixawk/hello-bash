#!/bin/bash

if [ $UID -ne 0 ]; then
    echo "[*] The script needs root privilege."
    exit 0
fi

FTP_HOME="/var/ftp"
apt-get install -y pure-ftpd
mkdir -p "$FTP_HOME"

groupadd ftpgroup
useradd -g ftpgroup -d /dev/null -s /etc ftpuser
pure-pw useradd ftpadmin -u ftpuser -d "$FTP_HOME"
pure-pw mkdb

cd /etc/pure-ftpd/auth/
ln -s ../conf/PureDB 60pdb
chown -R ftpuser:ftpgroup "$FTP_HOME"
service pure-ftpd start


# apt-get install -y ncftp
# ncftp -u ftpadmin -p password 127.0.0.1

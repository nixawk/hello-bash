#!/bin/bash

apt-get install -y atftpd
mkdir -p /srv/tftp
chown -R nobody /srv/tftp
echo "hello tftp-sevrer" > /srv/tftp/tftp.txt
service atftpd start

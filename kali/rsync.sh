#!/bin/bash

cat <<EOF >/etc/rsyncd.conf
lock file = /var/run/rsync.lock
log file = /var/log/rsyncd.log
pid file = /var/run/rsyncd.pid

[code]
    path = /var/rsync
    comment = The documents folder of Juan
    uid = root
    gid = root
    read only = no
    list = yes
    auth users = root
    secrets file = /etc/rsyncd.secrets
    hosts allow = *
    ignore errors = yes
EOF

cat << EOF >/etc/rsyncd.secrets
root:password
EOF

mkdir -p /var/rsync/
chmod -R 600 /var/rsync
service rsync start


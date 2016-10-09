#!/bin/bash

apt-get install -y nfs-kernel-server nfs-common

mkdir -p /var/nfs
echo "/var/nfs * (rw,no_root_squash)" >> /etc/exports

systemctl start rpcbind
systemctl start nfs-server

# mkdir -p /mnt/nfs
# mount -t nfs 127.0.0.1:/var/nfs /mnt/nfs -o nolock
# umount /mnt/nfs

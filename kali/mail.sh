#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-14-04

apt-get install -y mailutils postfix

# /etc/postfix/mail.cf
# inet_interfaces = localhost
service postfix restart

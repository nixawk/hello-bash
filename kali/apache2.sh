#!/bin/bash

apt-get install -y apache2 libapache2-mod-php phpmyadmin

[[ ! -e `which mysqld` ]] && echo "Please install mysql-server first" && exit 0

service start mysql
service start apache2

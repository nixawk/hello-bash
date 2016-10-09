#!/bin/bash

# Install MYSQL-Server
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

echo 'mysql-server mysql-server/root_password password password' | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password password' | debconf-set-selections

apt-get install -y mysql-server

service mysql start

#!/bin/bash

sudo apt-get install git-core build-essential libncurses5-dev
wget -c https://buildroot.uclibc.org/downloads/buildroot-snapshot.tar.bz2
tar xvf buildroot-snapshot.tar.bz2 && cd buildroot/
make menuconfig
export PATH=$PATH:`pwd`/output/host/usr/bin


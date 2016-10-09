#!/bin/bash

# /etc/snmp/snmpd.conf
# agentAddress  udp:0.0.0.0:161
# snmpwalk -c public -v 1 127.0.0.1

apt-get install snmp
service snmpd start

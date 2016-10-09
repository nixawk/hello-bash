#!/bin/bash

apt-get install -y xinetd telnetd

cat <<EOF > /etc/xinetd.d/telnet
service telnet
{
	disable		= yes
        flags           = REUSE
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/sbin/in.telnetd
        log_on_failure  += USERID
}
EOF

# /etc/pam.d/login

service xinetd start

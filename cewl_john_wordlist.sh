#!/bin/bash

# Please install [cewl] and [john-the-ripper] yourself.
 
if [ -z $1 ]; then
    echo "Usage: $0 http://www.demo.com/"
    exit 0
fi

TMPFILE="/tmp/cewl.txt"

cewl $1 -m 6 -w "$TMPFILE"

if [ -s $TMPFILE ];then
    john --wordlist=$TMPFILE --rules --stdout > cewl_john_password.wd
    exit 0
fi

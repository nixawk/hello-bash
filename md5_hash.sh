#!/bin/bash


function hashsum {
    regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
    if [[ $1 =~ $regex ]]; then
        echo -e "md5('$1'): \c"
        echo $(curl -s $1 | md5sum | cut -d ' ' -f1)
    fi

    if [ -e $1 ]; then
        echo -e "md5('$1'): \c"
        echo $(md5sum $1 | cut -d ' ' -f1)
    fi
}

hashsum "https://www.offensive-security.com/"
hashsum "/etc/passwd"

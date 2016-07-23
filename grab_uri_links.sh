#!/bin/bash

function download_links {
    regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
    if [[ $1 =~ $regex ]]; then
        curl -s $1 | grep -E -o "$regex" | while read link; do
            echo $link | cut -d "/" -f3
        done
    fi
}

download_links "http://www.cisco.com/" | sort -u
download_links "https://www.yahoo.com/" | sort -u

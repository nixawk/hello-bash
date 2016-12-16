#!/bin/bash

function backup_apks()
{
    for com in $(adb shell ls /data/data); do
      adb pull $(adb shell pm path $com | cut -d ':' -f2) .
    done
}

backup_apks

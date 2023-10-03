#!/bin/bash
# This script launches wspr in the background until it is killed

set -o errexit

if [ -n "$PS1" ]; then
    echo This is intended to be run ftom cron!
fi

grid=$(/usr/local/bin/wspr_get_grid.sh)

if [ -r $HOME/.callsign ]; then
    read -r callsign < $HOME/.callsign 
else
    echo Please specify your callsign in $HOME/.callsign
    exit -1
fi

sudo /usr/local/bin/wspr -r -o ${callsign} ${grid} 10 40m>>/var/log/wspr.log 2>&1 &


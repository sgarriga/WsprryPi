#!/bin/bash

# the GSSC runs Apr 8 2024 from 1400hrs to 2400 UTC...
# Let's start our beacon 1 hour before and shutdown 10 min after
#
local_time=`date --date='TZ="UTC" 2024-04-08 13:00:00' +%Y%m%d%H%M`
echo "wspr_beacon.sh" | at -q z -t $local_time

local_time=`date --date='TZ="UTC" 2024-04-09 00:10:00' +%Y%m%d%H%M`
echo "sudo pkill -9 wspr*" | at -q z -t $local_time

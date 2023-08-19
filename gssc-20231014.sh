#!/bin/bash

# the GSSC runs Oct 14 2023 from 1200hrs to 2200 UTC...
# Let's start our beacon 1 hour before and shutdown 10 min after
#
local_time=`date --date='TZ="UTC" 2023-10-14 11:00:00' +%Y%m%d%H%M`
echo "wspr_beacon.sh" | at -q z -t $local_time

local_time=`date --date='TZ="UTC" 2023-10-14 22:10:00' +%Y%m%d%H%M`
echo "sudo pkill -9 wspr*" | at -q z -t $local_time

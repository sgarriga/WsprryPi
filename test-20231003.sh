#!/bin/bash

# the TEST runs Oct 3 2023 from 2220hrs to 2250hrs UTC...
# Let's start our beacon 1 hour before and shutdown 10 min after
#
local_time=`date --date='TZ="UTC" 2023-10-04 22:20:00' +%Y%m%d%H%M`
echo "wspr_beacon.sh" | at -q z -t $local_time

local_time=`date --date='TZ="UTC" 2023-10-04 22:50:00' +%Y%m%d%H%M`
echo "sudo pkill -9 wspr" | at -q z -t $local_time

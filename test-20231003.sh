#!/bin/bash

# the TEST runs Oct 3 2023 from 1852hrs to 1854hrs UTC...
# Let's start our beacon 1 hour before and shutdown 10 min after
#
local_time=`date --date='TZ="UTC" 2023-10-04 18:52:00' +%Y%m%d%H%M`
echo "wspr_beacon.sh" | at -q z -t $local_time

local_time=`date --date='TZ="UTC" 2023-10-04 18:54:00' +%Y%m%d%H%M`
echo "sudo pkill -9 wspr" | at -q z -t $local_time

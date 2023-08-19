#!/bin/bash
# Try and locate a maidengead grid, or create one

set -o errexit
if [ -r $HOME/.maidenhead ]; then
    # Grab the specified maidenhead reference
    read -r grid < $HOME/.maidenhead
else
    # Look for a lat/lon source
    # raspberry-noaa-v2
    if [ -r $HOME/.noaa-v2.conf ]; then
        lat=`grep LAT $HOME/.noaa.conf | awk -F= '{ print $2; }'`
        lon=`grep LON $HOME/.noaa.conf | awk -F= '{ print $2; }'`

    # raspberry-noaa-v2
    else if [ -r $HOME/.noaa.conf ]; then
        lat=`grep LAT $HOME/.noaa.conf | awk -F= '{ print $2; }'`
        lon=`grep LON $HOME/.noaa.conf | awk -F= '{ print $2; }'`

    # wxtoimg
    else if [ -r $HOME/.wxtoimgrc ]; then
        lat=`grep Latitude: $HOME/.wxtoimgrc | awk '{ print $2; }'`
        lon=`grep Longitude: $HOME/.wxtoimgrc | awk '{ print $2; }'`
    fi
    fi
    fi
    if [ -z $lat ] || [ -z $lon ]; then
        echo Sorry can\'t locate a lat/lon source
        exit -1
    fi

    # Convert the lat/lon to maidenhead
    #  See https://github.com/sgarriga/maidenhead
    grid=$(maidenhead $lat $lon)
    if [ $? -ne 0 ]; then
        echo Could not convert lat/lon
        exit -1
    fi
    echo $grid > $HOME/.maidenhead
fi

echo $grid


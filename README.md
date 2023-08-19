# WsprryPi - a Raspberry Pi bareback LF/MF/HF/VHF WSPR transmitter

Makes a very simple WSPR beacon from your RasberryPi by connecting GPIO
port to Antenna (and LPF), operates on LF, MF, HF and VHF bands from
0 to 250 MHz.

This is a fork of https://github.com/g4wnc/WsprryPi (with input from https://github.com/JamesP6000/WsprryPi) with some custom scripts added to support the 2023 and 2024 GSSC (see https://hamsci.org/gssc-faqs) events.

See the original README file for all details and credits for the original work.

## Installation
On a fresh Raspian lite install (tested with Buster and Bullseye only)
Download and compile code:
    sudo apt-get install git https://github.com/sgarriga/WsprryPi
    cd WsprryPi
    make

Install to /usr/local/bin:
    sudo make install

Uninstall:
    sudo make uninstall


## Running
In $HOME create a .maidenhead file containing your 4 or 6 character maidenhead location. If it doesn't exist the scripts look for a few config files that might contain lat/lon and attempts to convert (requires https://github.com/sgarriga/maidenhead).

In $HOME create a .callsign file containing your Ham Radio callsign

A few days before, run the appropriate one of the gssc-20231014.sh or gssc-20240408.sh scripts for that specific day's event, or use one of them as a template to create your own for a different date.

## Notes
I found when running Buster that I cannot run wspr successfully while SSH'd into the Pi over WiFi. I have not bothered trying with Bullseye.


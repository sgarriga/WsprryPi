#!/bin/bash
# This script grabs all the required config then either performs a single WSPR ping or
# because of an interaction with SSH, schedules one a minute in the future and stops
# your SSH sessions

set -o errexit
prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}

grid=$(/usr/local/bin/wspr_get_grid.sh)

if [ -r $HOME/.callsign ]; then
    read -r callsign < $HOME/.callsign 
else
    echo Please specify your callsign in $HOME/.callsign
    exit -1
fi

# are we interactive and ssh?
if [ -n "$PS1" && -n "$SSH_CONNECTION" ]; then
    echo "This command will kill all SSH sessions!"
    prompt_confirm "Are you sure?" || exit 0
    echo Wait at least 2 minutes to reconnect

    echo "sudo /usr/local/bin/wspr -x 10 $callsign $grid 10 40m >> /var/log/wspr.log 2>&1" | at now + 1 minutes
    sudo pkill -9 -f sshd:
else
    sudo /usr/local/bin/wspr -x 10 $callsign $grid 10 40m >> /var/log/wspr.log 2>&1
fi



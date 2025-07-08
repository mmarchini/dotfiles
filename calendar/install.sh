#!/bin/zsh

set -xe

if ! which vdirsyncer; then
  pipx install vdirsyncer
fi

if ! which khal; then
  pipx install khal
fi

##########################
# All systemd unit files #
##########################

systemctl --user reenable --now $DOTFILES_PATH/calendar/vdirsyncer.service
systemctl --user reenable --now $DOTFILES_PATH/calendar/vdirsyncer.timer

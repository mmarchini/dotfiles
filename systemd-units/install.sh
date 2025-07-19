#!/bin/zsh

set -xe

##########################
# All systemd unit files #
##########################

systemctl --user reenable --now $DOTFILES_PATH/systemd-units/motd-dotstatus.service

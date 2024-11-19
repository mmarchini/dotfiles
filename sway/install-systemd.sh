#!/bin/zsh

set -xe

##########################
# All systemd unit files #
##########################


# Provided by Fedora package
systemctl --user reenable waybar.service
systemctl --user reenable mako.service
systemctl --user reenable kanshi.service

systemctl --user reenable --now $DOTFILES_PATH/sway/polkit-gnome/polkit-gnome.service
systemctl --user reenable --now $DOTFILES_PATH/sway/wlsunset/wlsunset.service
systemctl --user reenable --now $DOTFILES_PATH/sway/swayidle/swayidle.service

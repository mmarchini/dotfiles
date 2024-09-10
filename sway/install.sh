#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

# TODO: use a metapackage  to manage dependencies
sudo dnf install sway fuzzel wl-clipboard wlsunset waybar grim slurp xfce-polkit brightnessctl mako

# Configure sway
if [ ! -f ~/.config/sway/config ]; then
  mkdir -p ~/.config/sway/
  echo 'include "'"$DOTFILES_PATH"'/sway/swaywm/config"' > ~/.config/sway/config
  # ln -s $DOTFILES_PATH/sway/swaywm/config ~/.config/sway/config
fi

# Sway systemd session
systemctl --user link $DOTFILES_PATH/sway/sway-session.target

# Fuzzel
mkdir -p ~/.config/fuzzel
echo 'include="'$DOTFILES_PATH'/sway/fuzzel/fuzzel.ini"' > ~/.config/fuzzel/fuzzel.ini
echo 'include="'$DOTFILES_PATH'/sway/fuzzel/themes/mocha/red.ini"' >> ~/.config/fuzzel/fuzzel.ini

# Mako
if [ ! -f ~/.config/mako/config ]; then
  mkdir -p ~/.config/mako/
  ln -s $DOTFILES_PATH/sway/mako/config ~/.config/mako/config
fi
systemctl --user enable --now $DOTFILES_PATH/sway/mako/mako.service

# wlsunset
systemctl --user enable --now $DOTFILES_PATH/sway/wlsunset/wlsunset.service

# xfce-polkit
systemctl --user enable --now $DOTFILES_PATH/sway/xfce-polkit/xfce-polkit.service

# swayidle + swaylock
systemctl --user enable --now $DOTFILES_PATH/sway/swayidle/swayidle.service
if [ ! -f ~/.config/swaylock/config ]; then
  mkdir -p ~/.config/swaylock/
  ln -s $DOTFILES_PATH/sway/swaylock/config ~/.config/swaylock/config
fi
ln -sf $DOTFILES_PATH/sway/swaylock/lock.jpg ~/.config/swaylock/lock.jpg

# Force Wayland for electron apps
mkdir -p ~/.config/environment.d
ln -sf $DOTFILES_PATH/sway/environment.d/30-electron-wayland.conf ~/.config/environment.d/30-electron-wayland.conf

# Waybar
if [ ! -f ~/.config/waybar/config.jsonc ]; then
  mkdir -p ~/.config/waybar/
  ln -s $DOTFILES_PATH/sway/waybar/config.jsonc ~/.config/waybar/config.jsonc
fi

if [ ! -f ~/.config/waybar/style.css ]; then
  echo '@import "'$DOTFILES_PATH'/sway/waybar/style.css";' > ~/.config/waybar/style.css
fi
# TODO: waybar with systemd?


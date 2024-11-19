#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

# TODO: use a metapackage  to manage dependencies
sudo dnf install sway rofi-wayland  wl-clipboard wlsunset waybar grim slurp polkit-gnome brightnessctl mako kanshi

# GTK Catpuccin Theme
if [ ! -d ~/.local/share/themes/catppuccin-mocha-lavender-standard+default ]; then
  mkdir -p ~/.local/share/themes
  pushd ~/.local/share/themes
  wget https://github.com/catppuccin/gtk/releases/download/v1.0.3/catppuccin-mocha-lavender-standard+default.zip
  unzip catppuccin-mocha-lavender-standard+default.zip
  popd
fi

# Configure sway
if [ ! -f ~/.config/sway/config ]; then
  mkdir -p ~/.config/sway/
  echo 'include "'"$DOTFILES_PATH"'/sway/swaywm/config"' > ~/.config/sway/config
  # ln -s $DOTFILES_PATH/sway/swaywm/config ~/.config/sway/config
fi

# Sway systemd session

# Rofi
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.local/share/rofi
if [ ! -d $HOME/.local/share/rofi/themes ]; then
  ln -s $DOTFILES_PATH/sway/rofi/themes $HOME/.local/share/rofi/
fi
if [ ! -f $HOME/.config/rofi/config.rasi ]; then
  ln -s $DOTFILES_PATH/sway/rofi/config.rasi $HOME/.config/rofi/
fi

# Mako
if [ ! -f ~/.config/mako/config ]; then
  mkdir -p ~/.config/mako/
  ln -s $DOTFILES_PATH/sway/mako/config ~/.config/mako/config
fi

# swayidle + swaylock
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

$DOTFILES_PATH/sway/install-systemd.sh

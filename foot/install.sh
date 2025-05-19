#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if ! which foot; then
  if which apt-get > /dev/null; then
    sudo apt-get install -y foot
  elif which dnf > /dev/null; then
    sudo dnf install -y foot
  else
    brew install foot
  fi
fi

if [ ! -d ~/.config/foot/ ]; then
  mkdir -p ~/.config/foot/
  echo "include=${DOTFILES_PATH}/foot/foot.ini" > "$HOME/.config/foot/foot.ini"
  echo "include=${DOTFILES_PATH}/foot/catppuccin-mocha.ini" >> "$HOME/.config/foot/foot.ini"
fi

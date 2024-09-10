#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if ! which alacritty; then
  if which apt-get > /dev/null; then
    sudo apt-get install -y alacritty
  elif which dnf > /dev/null; then
    sudo dnf install -y alacritty
  else
    brew install alacritty
  fi
fi

echo 'import = [ "'"${DOTFILES_PATH}/alacritty/alacritty.toml"'", ]' > "$HOME/.alacritty.toml"

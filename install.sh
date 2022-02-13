#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if [ ! -d $HOME/.dotfiles ]; then
  git clone git@github.com:mmarchini/dotfiles $DOTFILES_PATH
else
  cd $DOTFILES_PATH
  git pull --ff-only
fi

for install in "${DOTFILES_PATH}"/*/install.sh; do
  "${install}"
done

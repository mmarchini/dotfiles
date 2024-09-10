#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

gitignore="$DOTFILES_PATH/git/gitignore"
if [ "!$(git config --global --get core.excludesfile)" != "!$gitignore" ]; then
  echo "Setting up global gitignore"
  git config --global core.excludesfile "$gitignore"
fi

gitconfig="$DOTFILES_PATH/git/gitconfig"
if ! (git config --global --get-all include.path | grep "$gitconfig"); then
  echo "Setting up global gitconfig"
  git config --global --add include.path "$gitconfig"
fi

#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

# TODO(mmarchini): check if value changed
# TODO(mmarchini): check if extra global configs are set
git config --global core.excludesfile "$DOTFILES_PATH/git/gitignore"
git config --global include.path "$DOTFILES_PATH/git/gitconfig"

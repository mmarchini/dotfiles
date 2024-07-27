#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if ! which  tmux > /dev/null; then
  if which apt-get > /dev/null; then
    sudo apt-get install -y tmux
  else
    brew install tmux
  fi
fi

if [ ! -d "$HOME/.tmux/plugins/" ]; then
  mkdir -p "$HOME/.tmux/plugins/"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "source-file ${DOTFILES_PATH}/tmux/tmux.conf" > "$HOME/.tmux.conf"

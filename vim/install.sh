#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if ! which vim > /dev/null; then
  if which apt-get > /dev/null; then
    sudo apt-get install -y vim curl
  else
    brew install vim curl
  fi
fi

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.bkp
fi
echo "source ${DOTFILES_PATH}/vim/vimrc" > "$HOME/.vimrc"

if [ -f ~/.vimrc.bkp ]; then
  if ! diff "${HOME}/.vimrc" "${HOME}/.vimrc.bkp"; then
    read -q "REPLY?Your vimrc contains uncommitted changes, please review before continuing [press any key to continue]"
  fi
fi

vim +'PlugInstall --sync' +qa 2>&1 >/dev/null

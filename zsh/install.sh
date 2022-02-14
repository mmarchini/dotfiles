#!/bin/zsh

set -xe
export DOTFILES_PATH=${DOTFILES_PATH:-"$HOME/.dotfiles"}

if which apt-get; then
  sudo apt-get install -y xclip zsh
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  mv ${HOME}/.zshrc ${HOME}/.zshrc.before.dotfiles
else
  "$ZSH"/tools/upgrade.sh
fi

# TODO(mmarchini): find a better way to handle the first install
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

###########
# Plugins #
###########

function syncPlugin {
  if [ -d "$ZSH_CUSTOM/plugins/$1" ]; then
    cd "$ZSH_CUSTOM/plugins/$1"
    git pull --ff-only
  else
    git clone $2 \
      "$ZSH_CUSTOM/plugins/$1"
  fi
}

syncPlugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
syncPlugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git

#########
# Theme #
#########

if [ -f "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme" ]; then
  mv "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme" "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme.bkp"
fi

cp "${DOTFILES_PATH}/zsh/themes/mmarchini.zsh-theme" "${ZSH_CUSTOM}/themes/"

if [ -f "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme.bkp" ]; then
  if ! diff "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme.bkp" "${ZSH_CUSTOM}/themes/mmarchini.zsh-theme"; then
    read -q "REPLY?zsh theme contains changes, [press key to continue]"
  fi
else
fi

#########
# zshrc #
#########


if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bkp
fi

echo "source ${DOTFILES_PATH}/zsh/activate" > "$HOME/.zshrc"

if [ -f ~/.zshrc.bkp ]; then
  if ! diff "${HOME}/.zshrc" "${HOME}/.zshrc.bkp"; then
    read -q "REPLY?Your zshrc contains uncommitted changes, please review before continuing [press any key to continue]"
  fi
fi

source $HOME/.zshrc

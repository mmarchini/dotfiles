export ZSH=$HOME/.oh-my-zsh

DOTFILES_PATH=$(dirname $(dirname $(readlink ${(%):-%N})))

DIRTY_FILES="$(cd $DOTFILES_PATH && git status --porcelain 2>/dev/null)"
if [ -n "$DIRTY_FILES" ]; then
  echo "WARNING: dotfiles folder is dirty";
fi;

OUT_OF_SYNC="$(cd $DOTFILES_PATH && git rev-list -n 1 HEAD@{upstream}..HEAD)"
if [ -n "$OUT_OF_SYNC" ]; then
  echo "WARNING: dotfiles folder is out of sync";
fi;

ZSH_THEME="mmarchini"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  docker
  npm
  osx
  virtualenv
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'

export PATH=$HOME/.bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Python/3.6/bin:$PATH
export PATH=$HOME/go/bin:$PATH

source $HOME/.zsh-aliases

# nvm
export NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  --no-use # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

export GPG_TTY=$(tty)

[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# required for Ctrl-O to work with neomutt
stty discard undef

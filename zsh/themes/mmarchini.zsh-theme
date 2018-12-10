#!/usr/bin/env zsh

local STATUS_LEFT="%(?,%{$fg_bold[green]%}/,%{$fg_bold[red]%}/)"
local STATUS_RIGHT="%(?,%{$fg_bold[green]%}/,%{$fg_bold[red]%}/)"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  STATUS_LEFT="%{$fg_bold[blue]%}{%{$reset_color%}"
  STATUS_RIGHT="%{$fg_bold[blue]%}}%{$reset_color%}"
else
  case $(ps -o comm= -p $PPID) in sshd|*/sshd)
    STATUS_LEFT="%{$fg_bold[blue]%}{%{$reset_color%}"
    STATUS_RIGHT="%{$fg_bold[blue]%}}%{$reset_color%}"
  esac
fi

local HOSTNAME="%m"
local STATUS="$STATUS_LEFT%(?,%{$fg_bold[green]%}$HOSTNAME,%{$fg_bold[red]%}$HOSTNAME)%{$reset_color%}$STATUS_RIGHT"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%3~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function get_right_prompt() {
  echo "$(virtualenv_prompt_info)$(nvm_prompt_info)[%{${fg_bold[cyan]}%}%*%{$reset_color%}]"
}

PROMPT=$'\n'$STATUS'$(ps1_exec_async > /dev/null 2>/dev/null &)\
 %{$fg_no_bold[yellow]%}$(get_pwd)\
 $(git_prompt_info)
 %{$fg_bold[cyan]%}→ %{$reset_color%}'

RPROMPT='$(get_right_prompt)'

# Format for git_prompt_info()
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[white]%}at %{$fg[blue]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} ✔"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"


# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

# Format for virtualenv_prompt_info()
ZSH_THEME_VIRTUALENV_PREFIX="🐍 %{$fg_bold[yellow]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%} "

# Format for nvm_prompt_info()
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg_bold[green]%}⬡%{$fg_bold[yellow]%} "
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%} "

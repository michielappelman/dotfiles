#!/bin/sh
# Colourful manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Set to avoid `env` output from changing console colour
export LESS_TERMEND=$'\E[0m'
export CLICOLOR=1

quiet_which() {
  which $1 &>/dev/null
}

# Set up editor
if quiet_which nvim
then
  export EDITOR="nvim"
  alias vi="nvim"
  alias vim="nvim"
elif quiet_which vim
then
  export EDITOR="vim"
  alias vi="vim"
elif quiet_which vi
then
  export EDITOR="vi"
fi
alias e="$EDITOR"

if quiet_which bat
then
  export BAT_THEME="ansi"
  alias qat="bat --paging=never"
fi

if quiet_which diff-so-fancy
then
  export GIT_PAGER='diff-so-fancy | less -+$LESS -RX'
else
  export GIT_PAGER='less -+$LESS -RX'
fi

if [ $OSX ]
then
  export GREP_OPTIONS="--color=auto"
  export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
  
  alias ls="ls -F"
  alias ql="qlmanage -p 1>/dev/null"
  alias locate="mdfind -name"
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias finder-hide="setfile -a V"
  if quiet_which brew
  then
    eval $(brew shellenv)
    export HOMEBREW_AUTO_UPDATE_SECS=3600
    export HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1
  fi
elif [ $LINUX ]
then
  alias su="/bin/su -"
  alias ls="ls -F --color=auto"
fi


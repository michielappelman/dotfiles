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

quiet_which() {
  which $1 &>/dev/null
}

if [ $OSX ]
then
  export GREP_OPTIONS="--color=auto"
  export CLICOLOR=1
  export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
  if quiet_which diff-highlight
  then
    export GIT_PAGER='diff-highlight | less -+$LESS -RX'
  else
    export GIT_PAGER='less -+$LESS -RX'
  fi

  alias ls="ls -F"
  alias ql="qlmanage -p 1>/dev/null"
  alias locate="mdfind -name"
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias finder-hide="setfile -a V"

elif [ $LINUX ]
then
  alias su="/bin/su -"
  alias ls="ls -F --color=auto"
fi

if quiet_which nvim
then
  export EDITOR="nvim"
elif quiet_which subl || quiet_which sublime_text
then
  quiet_which subl && export EDITOR="subl"
  quiet_which sublime_text && export EDITOR="sublime_text" \
    && alias subl="sublime_text"

  export GIT_EDITOR="$EDITOR -w"
  export SVN_EDITOR="$GIT_EDITOR"
elif quiet_which vi
then
  export EDITOR="vi"
fi

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


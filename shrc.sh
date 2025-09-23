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

## Aliases
alias pp="ps axuf | pager"
alias curl="curl -s --proto-default https"
alias g="git"
alias whois-c="whois -h whois.cymru.com"
alias q="q -s https://cloudflare-dns.com/dns-query -w"
alias jcurl="curl -H 'Content-Type:application/json'"

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

if quiet_which z
then
    alias cd="zd"
    zd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ && return
    elif [ -d "$1" ]; then
        builtin cd "$1"
    else
        z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
    }
fi

if quiet_which diff-so-fancy
then
  export GIT_PAGER='diff-so-fancy | less -+$LESS -RX'
else
  export GIT_PAGER='less -+$LESS -RX'
fi

if [ $MACOS ]
then
  export GREP_OPTIONS="--color=auto"

  alias ls="ls -F"
  alias ql="qlmanage -p 1>/dev/null"
  alias locate="mdfind -name"
  alias cpwd="pwd | tr -d '\n' | pbcopy"
  alias finder-hide="setfile -a V"
elif [ $LINUX ]
then
  alias su="/bin/su -"
  alias ls="ls -F --color=auto"
  open() {
    xdg-open "$@" >/dev/null 2>&1 &
  }
fi

if quiet_which eza
then
    alias ls='eza -lh --no-permissions --icons=auto --git'
    alias lsa='ls -a'
    alias lt='eza -l --no-permissions --tree --level=2 --icons --git'
    alias lta='lt -a'
fi

source ~/.base16-rose-pine-dawn

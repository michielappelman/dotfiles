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

## SSH Config
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
alias sas='eval $(ssh-agent -s -a ${SSH_AUTH_SOCK})'
alias sap="ssh-add ~/.ssh/personal_hosts_ed25519 ~/.ssh/personal_hosts_rsa"
alias sag="ssh-add ~/.ssh/github_ed25519 ~/.ssh/gitlab_ed25519"
alias sak="ssh-add ~/.ssh/blue_yubi_sk"
alias sac="ssh-add ~/.ssh/cf_yubi_sk"

## Aliases
alias pp="ps axuf | pager"
alias curl="curl -s --proto-default https"
alias g="git"
alias qrme="qrencode -t UTF8i < ~/Documents/Cloudflare/Michiel\ Appelman.vcf"
alias whois="whois -h whois.cymru.com"
alias q="q -s https://cloudflare-dns.com/dns-query"
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

if quiet_which diff-so-fancy
then
  export GIT_PAGER='diff-so-fancy | less -+$LESS -RX'
else
  export GIT_PAGER='less -+$LESS -RX'
fi

if [ $MACOS ]
then
  export GREP_OPTIONS="--color=auto"
  export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

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

source ~/.base16-rose-pine-dawn

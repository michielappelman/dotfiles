#!/bin/bash
# Save more history
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

export GOPATH=$HOME/sources/go
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:${PATH}"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## SSH Config
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
alias sas='eval $(ssh-agent -s -a ${SSH_AUTH_SOCK})'
alias sap="ssh-add ~/.ssh/personal_hosts_ed25519 ~/.ssh/personal_hosts_rsa"
alias sag="ssh-add ~/.ssh/github_ed25519 ~/.ssh/gitlab_ed25519"
alias sak="ssh-add ~/.ssh/blue_yubi_sk"
alias sac="ssh-add ~/.ssh/nano_yubi_sk"

[ "$(uname -s)" = "Darwin" ] && export MACOS=1 && export UNIX=1
[ "$(uname -s)" = "Linux" ] && export LINUX=1 && export UNIX=1
if [[ $MACOS == 1 ]]
then
  export HOMEBREW_PREFIX="/opt/homebrew";
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
  export HOMEBREW_REPOSITORY="/opt/homebrew";
  export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:${PATH}";
  export MANPATH="$HOMEBREW_PREFIX/share/man:${MANPATH}";
  export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH}";
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

export PIP_REQUIRE_VIRTUALENV=true
function gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@"; }
function gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@"; }

## Functions
# removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }

# directory functions
function mkcd() { mkdir -p "$@" && cd "$1" || exit; }
function ..() { for i in $(seq 1 $1); do cd ..; done }

# Short, but not too short, dig
function dg() { dig +nocomments +nocmd +nostats "$@"; }

# Repeat command
function rep() { for _ in $(seq 1 $1) ; do eval "$(echo "$@" | cut -d " " -f 2-)"; sleep 1; done }

# Find IPv4 Addresses
# Required brew packages: ipinfo-cli grepip fzf
function analyze-ips() { fzf --preview='ipinfo bulk $(echo {} | grepip -o)' --reverse; }

# IPify request
function ipify() { curl -s "https://geo.ipify.org/api/v2/country?apiKey=${IPIFY_TOKEN}&ipAddress=$@" | jq; }

# Create a new Python virtual env
function pynew() {
  version=${2:-3.11}
  mkdir -p "$1" && cd "$1" &&
  echo "python = \"$version\"" > .mise.toml &&
  mise install &&
  python -m venv .venv &&
  source .venv/bin/activate &&
  pip install --upgrade pip &&
  [ -e "requirements.txt" ] && pip install -r requirements.txt
}

## Lazy Loading Functions
# l_nvm() {
#   unset -f npm node nvm
#   if [[ $MACOS == 1 ]]
#   then
#     export NVM_DIR="$HOME/.nvm"
#     export NVM_EXEC_DIR="/opt/homebrew/opt/nvm"
#   else
#     export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
#     export NVM_EXEC_DIR="$NVM_DIR"
#   fi
#   [ -s "$NVM_EXEC_DIR/nvm.sh" ] && source "$NVM_EXEC_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
# }
#
# function l_pyenv() {
#     export PYENV_ROOT="$HOME/.pyenv"
#     export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#     export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#     [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)"
#     # eval "$(pyenv init - --no-rehash zsh)"
#     # eval "$(pyenv virtualenv-init -)"
# }

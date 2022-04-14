#!/bin/bash
# Save more history
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

export GOPATH=$HOME/sources/go
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:${PATH}"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ "$(uname -s)" = "Darwin" ] && export MACOS=1 && export UNIX=1
[ "$(uname -s)" = "Linux" ] && export LINUX=1 && export UNIX=1
if [[ $MACOS == 1 ]]
then
  export HOMEBREW_PREFIX="/opt/homebrew";
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
  export HOMEBREW_REPOSITORY="/opt/homebrew";
  export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:${PATH}";
  export MANPATH="$HOMEBREW_PREFIX/share/man:${MANPATH}";
  export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH}";
  export HOMEBREW_NO_AUTO_UPDATE=1
  export HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1
fi

export PIP_REQUIRE_VIRTUALENV=true
function gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@"; }
function gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@"; }

## Functions
function hs() { grep $1 "$HISTFILE"; }

# removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }
# directory functions
function mkcd() { mkdir -p "$@" && cd "$1"; }
function ..() { for i in $(seq 1 $1); do cd ..; done }

# fff cd on exit
function f() { fff "$@"; cd "$(cat ~/.fff_d)"; }

# Short, but not too short, dig
function dg() { dig +nocomments +nocmd +nostats "$@"; }

# Repeat command
function rep() { for _ in $(seq 1 $1) ; do eval "$(echo "$@" | cut -d " " -f 2-)"; sleep 1; done }

# JSON Curl
function jcurl() { curl "$@" -H "Content-Type:application/json" | jq; }

# Create a new Python virtual env
function pynew() {
  version=${2:-3.6.5}
  mkdir -p "$1" && cd "$1" &&
  pyenv virtualenv "$version" "$1"-"$version" &&
  pyenv local "$1"-"$version" &&
  pip install --upgrade pip &&
  [ -e "requirements.txt" ] &&
  pip install -r requirements.txt
}

## Lazy Loading Functions
function l_pyenv() {
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init - --no-rehash zsh)"
    eval "$(pyenv virtualenv-init -)"
}

function l_gcloud() {
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
}

function l_nvm() {
  export NVM_DIR="$HOME/.nvm"
  if [[ $MACOS == 1 ]]
  then
    export NVM_EXEC_DIR="/opt/homebrew/opt/nvm"
  else
    export NVM_EXEC_DIR="$NVM_DIR"
  fi
  [ -s "$NVM_EXEC_DIR/nvm.sh" ] && \. "$NVM_EXEC_DIR/nvm.sh"
  [ -s "$NVM_EXEC_DIR/bash_completion" ] && \. "$NVM_EXEC_DIR/bash_completion"
}

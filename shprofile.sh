# Save more history
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

export GOPATH=$HOME/go
export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ "$(uname -s)" = "Darwin" ] && export MACOS=1 && export UNIX=1
[ "$(uname -s)" = "Linux" ] && export LINUX=1 && export UNIX=1

export PIP_REQUIRE_VIRTUALENV=true
function gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@"; }
function gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@"; }

## SSH Config
export SSH_AUTH_SOCK="/tmp/ssh-agent"
alias sas="ssh-agent -a $SSH_AUTH_SOCK > /dev/null"
alias sap="ssh-add ~/.ssh/personal_hosts_ed25519 ~/.ssh/personal_hosts_rsa"
alias sak="ssh-add ~/.ssh/id_ecdsa_sk"

alias pp="ps axuf | pager"
alias curl="curl --proto-default https"
alias g="git"

## Functions
function hs() { grep $1 "$HISTFILE" }
# removes lines from $1 if they appear in $2
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function mkcd() { mkdir -p "$@" && cd "$1"; }
function ..() { 
  for i in $(seq 1 $1); do cd ..; done 
}
# fff cd on exit
function f() { fff "$@"; cd "$(cat ~/.fff_d)"; }

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

## Lazy Loading
function l_pyenv() {
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init - --no-rehash zsh)"
    eval "$(pyenv virtualenv-init -)"
}

function l_gcloud() {
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/mappelma/Documents/sources/google-cloud-sdk/path.zsh.inc' ]
    then
        . '/Users/mappelma/Documents/sources/google-cloud-sdk/path.zsh.inc'
    fi
    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/mappelma/Documents/sources/google-cloud-sdk/completion.zsh.inc' ]
    then
        . '/Users/mappelma/Documents/sources/google-cloud-sdk/completion.zsh.inc'
    fi
}

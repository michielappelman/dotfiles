# Save more history
export HISTSIZE=100000
export SAVEHIST=100000
export KEYTIMEOUT=1

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# OS variables
[ "$(uname -s)" = "Darwin" ] && export MACOS=1 && export UNIX=1
[ "$(uname -s)" = "Linux" ] && export LINUX=1 && export UNIX=1
uname -s | grep -q "_NT-" && export WINDOWS=1
grep -q "Microsoft" /proc/version 2>/dev/null && export UBUNTU_ON_WINDOWS=1

export BREW_PREFIX="/usr/local"

export PIP_REQUIRE_VIRTUALENV=true

## SSH Config
export SSH_AUTH_SOCK="/tmp/ssh-agent"
# GPG for SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

## Aliases
alias pp="ps axuf | pager"
alias sag="ssh-agent -a $SSH_AUTH_SOCK > /dev/null && ssh-add ~/.ssh/personal_hosts_ed25519 ~/.ssh/personal_hosts_rsa"
alias qat="bat --paging=never -n"
alias curl="curl --proto-default https"

## Functions
# FROM http://cfenollosa.com/misc/tricks.txt
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@" }
function gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@" }

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

# fff cd on exit
f() { fff "$@"; cd "$(cat ~/.fff_d)"; }

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

# Save more history
export HISTSIZE=100000
export SAVEHIST=100000

##### Variables #####
export KEYTIMEOUT=1
export SSH_AUTH_SOCK=/tmp/ssh-agent
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/texlive/2015/bin/x86_64-darwin/"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PIP_REQUIRE_VIRTUALENV=true

##### Aliases #####
alias pp="ps axuf | pager"
alias gpa="git remote | xargs -L1 git push --all"
alias sag="ssh-agent -a $SSH_AUTH_SOCK > /dev/null && ssh-add ~/.ssh/id_rsa"

##### Functions #####
# FROM http://cfenollosa.com/misc/tricks.txt
function remove_lines_from() { grep -F -x -v -f $2 $1; }
function gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@" }
function gpip3() { PIP_REQUIRE_VIRTUALENV="" pip3 "$@" }

# Create a new Python virtual env
function pynew() {
  version=${2:-3.5.2}
  mkdir -p "$1" && cd "$1" &&
  pyenv virtualenv "$version" "$1"-"$version" &&
  pyenv local "$1"-"$version" &&
  pip install --upgrade pip &&
  pip install pylint &&
  pip install neovim &&
  pip install yapf &&
  [ -e "requirements.txt" ] &&
  pip install -r requirements.txt
}


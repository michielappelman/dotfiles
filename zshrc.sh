# load shared shell configuration
source ~/.shrc

# Style Options
SPACESHIP_GIT_SYMBOL="🎋  "
SPACESHIP_VENV_SHOW=false

# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom
HIST_STAMPS="dd.mm.yyyy"
DISABLE_UPDATE_PROMPT=true
UPDATE_ZSH_DAYS=31

ZSH_THEME=spaceship
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  rust          # Rust section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

if which brew &>/dev/null
then
  [ -w $BREW_PREFIX/bin/brew ] && \
    [ ! -f $BREW_PREFIX/share/zsh/site-functions/_brew ] && \
    mkdir -p $BREW_PREFIX/share/zsh/site-functions &>/dev/null && \
    ln -s $BREW_PREFIX/Library/Contributions/brew_zsh_completion.zsh \
          $BREW_PREFIX/share/zsh/site-functions/_brew
  export FPATH="$BREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

plugins=(git docker dirhistory mosh pep8 rsync python tmux sudo osx vagrant pylint pip history httpie git-extras django)
source $ZSH/oh-my-zsh.sh
source ~/.zprofile

##### Key bindings #####
bindkey '^S' sudo-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '\e.' insert-last-word

# Run archey if available:
if $(which archey >/dev/null 2>&1); then
    archey -c -o
fi

if which pyenv > /dev/null; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

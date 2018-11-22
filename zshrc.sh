# load shared shell configuration
source ~/.shrc

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
  xcode         # Xcode section
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
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT:="i"}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL:="n"}"
SPACESHIP_GIT_SYMBOL="🎋  "
SPACESHIP_VENV_SHOW=false

plugins=(zsh-autosuggestions git dirhistory mosh rsync python tmux sudo osx pip history httpie git-extras vi-mode)
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mappelma/Documents/sources/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mappelma/Documents/sources/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mappelma/Documents/sources/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mappelma/Documents/sources/google-cloud-sdk/completion.zsh.inc'; fi

# zmodload zsh/zprof

# check if this is a login shell
[ "$0" = "-zsh" ] && export LOGIN_ZSH=1
# run zprofile if this is not a login shell
[ -n "$LOGIN_ZSH" ] && source ~/.zprofile

source ~/.shrc
export HISTFILE=~/.zsh_history
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt share_history

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
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )
SPACESHIP_VI_MODE_INSERT="I"
SPACESHIP_VI_MODE_NORMAL="N"
SPACESHIP_VI_MODE_COLOR="yellow"
SPACESHIP_GIT_SYMBOL="🎋  "
SPACESHIP_VENV_SHOW=false

plugins=(sudo zsh-z zsh-autosuggestions sublime brew git mosh rsync python tmux osx history httpie vi-mode)
source $ZSH/oh-my-zsh.sh

eval spaceship_vi_mode_enable

zstyle ':completion:*' menu select

##### Key bindings #####
bindkey '^S' sudo-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '\e.' insert-last-word

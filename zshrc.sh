# zmodload zsh/zprof
source ~/.zprofile
source ~/.shrc

export HISTFILE=~/.zsh_history
export RPS1="%{$reset_color%}"

setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt share_history

HIST_STAMPS="dd.mm.yyyy"
DISABLE_UPDATE_PROMPT=true

zstyle ':completion:*' menu select

source $HOME/.dotfiles/zsh-z.plugin.zsh

eval "$(starship init zsh)"

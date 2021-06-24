# zmodload zsh/zprof
source ~/.zprofile
source ~/.shrc

export HISTFILE=~/.zsh_history
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt share_history

HIST_STAMPS="dd.mm.yyyy"
DISABLE_UPDATE_PROMPT=true

eval "$(starship init zsh)"

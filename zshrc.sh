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

zstyle ':autocomplete:*' recent-dirs zsh-z
zstyle ':autocomplete:*' widget-style menu-select

source $HOME/.dotfiles/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-z/zsh-z.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

bindkey -M menuselect $key[Return] accept-line

eval "$(starship init zsh)"

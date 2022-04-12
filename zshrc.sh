# zmodload zsh/zprof
source ~/.zprofile
source ~/.shrc

bindkey -v
bindkey "^R" history-incremental-search-backward

export HISTFILE=~/.zsh_history

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt inc_append_history

zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' ignored-input '..##'

source $HOME/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-z/zsh-z.plugin.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=249'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

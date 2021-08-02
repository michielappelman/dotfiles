# zmodload zsh/zprof
source ~/.zprofile
source ~/.shrc

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

export HISTFILE=~/.zsh_history

setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt share_history

HIST_STAMPS="dd.mm.yyyy"
DISABLE_UPDATE_PROMPT=true

zstyle ':autocomplete:*' recent-dirs zsh-z
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' ignored-input '..##'

source $HOME/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.dotfiles/plugins/zsh-z/zsh-z.plugin.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=249'

bindkey -M menuselect $key[Return] .accept-line

eval "$(starship init zsh)"

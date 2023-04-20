# zmodload zsh/zprof
source ~/.zprofile
source ~/.shrc

autoload -U compinit && compinit

bindkey -v

export HISTFILE=~/.zsh_history

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history

source $HOME/.dotfiles/plugins/zsh-z/zsh-z.plugin.zsh
zstyle ':completion:*' menu select

which starship &>/dev/null && eval "$(starship init zsh)"
which direnv &>/dev/null && eval "$(direnv hook zsh)"

if [ -f ~/.fzf.zsh ]
then
  source ~/.fzf.zsh

  export FZF_DEFAULT_OPTS="--ansi --info inline"
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd -t d . $HOME"

  _fzf_compgen_path() {
    fd --hidden --follow --exclude .git . "$1"
  }
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude .git . "$1"
  }
  bindkey '^[[A' fzf-history-widget
fi


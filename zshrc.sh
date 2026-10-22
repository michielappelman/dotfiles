# zmodload zsh/zprof
source ~/.shrc
source ~/.shprofile

autoload -U compinit && compinit

bindkey -v
# keep some useful emacs bindings
bindkey '\e.' insert-last-word                   # Alt+. (last argument)
bindkey '^A' beginning-of-line                   # Ctrl+A (start of line)
bindkey '^E' end-of-line                         # Ctrl+E (end of line)
bindkey '^R' history-incremental-search-backward # Ctrl+R (search)

export HISTFILE=~/.zsh_history

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history

zstyle ':completion:*' menu select

which mise &>/dev/null && eval "$(mise activate zsh)"
which starship &>/dev/null && eval "$(starship init zsh)"
which direnv &>/dev/null && eval "$(direnv hook zsh)"
which zoxide &>/dev/null && eval "$(zoxide init zsh)"

if which fzf &>/dev/null; then
  if [[ $MACOS == 1 ]]; then
    [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2>/dev/null
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

    export ITERM2_SQUELCH_MARK=1
    source ~/.iterm2_shell_integration.zsh
  fi

  if [[ $LINUX == 1 ]]
  then
      if command -v fzf &> /dev/null; then
        alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
        if [[ -f /usr/share/fzf/completion.zsh ]]; then
          source /usr/share/fzf/completion.zsh
        fi
        if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
          source /usr/share/fzf/key-bindings.zsh
        fi
      fi
  fi

  if which fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --color=always"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -t d . $HOME"

    _fzf_compgen_path() {
      fd --hidden --follow --exclude .git . "$1"
    }
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude .git . "$1"
    }
  fi

  bindkey -a '/' fzf-history-widget
  bindkey '^R' fzf-history-widget
  export FZF_DEFAULT_OPTS="--ansi --info inline"

fi

# CF CLI completions
[[ -f "$HOME/.config/cf/completions/_cf.zsh" ]] && source "$HOME/.config/cf/completions/_cf.zsh"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

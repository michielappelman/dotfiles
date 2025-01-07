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

if which fzf &>/dev/null
then
  if [[ $MACOS == 1 ]]
  then
    if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
      PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
    fi
    [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

    export ITERM2_SQUELCH_MARK=1
    source ~/.iterm2_shell_integration.zsh
  fi

  if [[ $LINUX == 1 ]]
  then
    [[ $- == *i* ]] && source "/usr/share/doc/fzf/examples/completion.zsh" 2> /dev/null
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
  fi

  if which fd &>/dev/null
  then
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

  bindkey '^[[A' fzf-history-widget
  export FZF_DEFAULT_OPTS="--ansi --info inline"

fi


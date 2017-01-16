# load shared shell configuration
source ~/.shrc

# oh-my-zsh config
export ZSH=$HOME/.oh-my-zsh
HIST_STAMPS="dd.mm.yyyy"
DISABLE_UPDATE_PROMPT=true

if which brew &>/dev/null
then
  [ -w $BREW_PREFIX/bin/brew ] && \
    [ ! -f $BREW_PREFIX/share/zsh/site-functions/_brew ] && \
    mkdir -p $BREW_PREFIX/share/zsh/site-functions &>/dev/null && \
    ln -s $BREW_PREFIX/Library/Contributions/brew_zsh_completion.zsh \
          $BREW_PREFIX/share/zsh/site-functions/_brew
  export FPATH="$BREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

plugins=(git docker dirhistory mosh pep8 rsync python tmux sudo osx vagrant pylint pip history httpie git-extras django)
source $ZSH/oh-my-zsh.sh
source ~/.zprofile

##### Variables #####
export UPDATE_ZSH_DAYS=31

##### Key bindings #####
bindkey '^S' sudo-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '\e.' insert-last-word

# Prompt Styling
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function user {
    [[ $(id -u) -eq 0 ]] && echo "%{$fg[red]%}%n%{$reset_color%}" && return
    echo "%{$fg[cyan]%}%n%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"

PROMPT='$(user).%{$fg[green]%}%m%{$reset_color%} %2~ $(git_prompt_info)%{$reset_color%}%B»%b '
RPS1='$(vi_mode_prompt_info) ${return_code}'

# Run archey if available:
if $(which archey >/dev/null 2>&1); then
    archey -c -o
fi

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

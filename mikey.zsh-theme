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

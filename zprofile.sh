# load shared shell configuration
source ~/.shprofile

# Enable completions
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
    compinit
else
    compinit -C
fi

# Style ZSH output
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format '%B%F{red}Sorry, no matches for: %d%f%b'


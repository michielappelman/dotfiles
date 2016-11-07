# load shared shell configuration
source ~/.shprofile

# Enable completions
autoload -U compinit && compinit

# Style ZSH output
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format '%B%F{red}Sorry, no matches for: %d%f%b'


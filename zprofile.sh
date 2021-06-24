# load shared shell configuration
source ~/.shprofile

# Enable completions
autoload -Uz compinit

# Update once per day
if [ $MACOS ]; then
    mod_doy=$(stat -f '%Sm' -t '%j' ~/.zcompdump)
else
    mod_doy=$(date -d "@$(stat -c "%Y" ~/.zcompdump)" "+%j")
fi

if [ $(date +'%j') != $mod_doy ]; then
    compinit
else
    compinit -C
fi

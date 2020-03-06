export ZPLUG_HOME=$XDG_DATA_HOME/zplug
source $ZPLUG_HOME/init.zsh

zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug 'plugins/gitfast', from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

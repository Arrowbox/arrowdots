export MINICONDA_HOME=$XDG_DATA_HOME/miniconda
export MINICONDA3_HOME=$XDG_DATA_HOME/miniconda3

__conda_setup="$('$MINICONDA_HOME/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$MINICONDA_HOME/etc/profile.d/conda.sh" ]; then
        . "$MINICONDA_HOME/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:$MINICONDA_HOME/bin"
    fi
fi
unset __conda_setup

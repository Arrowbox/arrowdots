declare -A ZINIT

ZINIT[HOME]="$XDG_DATA_HOME/zinit"
ZINIT[BIN]="$ZINIT[HOME]/bin"
ZINIT[PLUGINS_DIR]="$ZINIT[HOME]/plugins"
ZINIT[COMPLETIONS_DIR]="$ZINIT[HOME]/completions"
ZINIT[SNIPPETS_DIR]="$ZINIT[HOME]/snippets"

source $ZINIT[BIN]/zinit.zsh

# Load before prompt to ensure history files are setup
zinit ice lucid
zinit snippet PZTM::history

zinit ice wait lucid blockf
zinit snippet PZTM::utility

zinit ice wait lucid blockf
zinit snippet PZTM::completion

zinit ice wait lucid from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit cdclear -q

zinit ice wait lucid as"completion"
zinit snippet https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh

zinit ice wait lucid as"completion"
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh

zinit ice wait lucid
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh

zinit ice wait lucid as"program" pick"wd.sh" atload"wd() { source wd.sh }"
zinit light mfaerevaag/wd

zinit ice wait lucid from"gh-r" bpick"*linux-amd64" as"program" mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit load direnv/direnv

zinit ice wait lucid blockf atpull'zinit creinstall -q .' atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-completions

# No plugins with completions after the 'zicompinit; zicdreplay'
zinit ice wait lucid pick'virtualenvwrapper.sh'
zinit light /usr/share/virtualenvwrapper/

zinit ice wait lucid atload'!_zsh_autosuggest_start; bindkey $ZSH_AUTOSUGGEST_ACCEPT_KEY autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

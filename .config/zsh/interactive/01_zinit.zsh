declare -A ZINIT

ZINIT[HOME]="$XDG_DATA_HOME/zinit"
ZINIT[BIN]="$ZINIT[HOME]/bin"
ZINIT[PLUGINS_DIR]="$ZINIT[HOME]/plugins"
ZINIT[COMPLETIONS_DIR]="$ZINIT[HOME]/completions"
ZINIT[SNIPPETS_DIR]="$ZINIT[HOME]/snippets"

source $ZINIT[BIN]/zinit.zsh

zinit snippet PZTM::utility
zinit snippet PZTM::completion
zinit snippet PZTM::history

zinit cdclear -q

zinit ice wait lucid as"completion"
zinit snippet https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh

zinit ice wait lucid as"program" pick"wd.sh" atload"wd() { source wd.sh }"
zinit light mfaerevaag/wd

zinit ice wait lucid from"gh-r" bpick"*linux-amd64" as"program" mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit load direnv/direnv

zinit ice wait lucid from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid blockf atpull'zinit creinstall -q .' atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-completions

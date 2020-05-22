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

zinit ice as"completion"
zinit snippet https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit ice as"program" pick"wd.sh" atload"wd() { source wd.sh }"
zinit light mfaerevaag/wd

zinit ice from"gh-r" bpick"*linux-amd64" as"program" mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit load direnv/direnv


autoload -Uz compinit
compinit

zinit cdreplay -q

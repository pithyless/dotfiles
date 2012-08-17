alias ssh-hotx-tunnel="ssh -fNn deploy@hotx.resfinity.com"

alias l="ls -F"
alias la="ls -Fa"
alias ll="ls -Flh"
alias lls="ls -FlhSr"
alias llt="ls -Flhtr"

alias dff="df -h"
alias dus="du -sh"

if [[ $IS_LINUX -eq 1 ]]; then
  alias ack="ack-grep"
fi

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'

# Go to parent directories without `cd'
setopt autocd
alias c='cd'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

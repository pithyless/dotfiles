alias ssh-hotx-tunnel="ssh -fNn deploy@hotx.resfinity.com"

alias l="ls -F"
alias la="ls -Fa"
alias ll="ls -Flh"
alias lls="ls -FlhSr"
alias llt="ls -Flhtr"

alias dff="df -h"
alias dus="du -sh"

alias psa="ps aux | grep -i"

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
cdpath=($HOME $HOME/dev/anixe $HOME/dev/github)
alias c=cd
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'


dls () {
 # directory LS
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs kill
}

mcd () {
    mkdir "$@" && cd "$@"
}

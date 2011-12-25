
if [ ${OSTYPE:0:5} = "linux" ]; then
  alias git='GIT_AUTHOR_EMAIL=$(
      p=$(pwd)
      while [[ $p != "$HOME" ]]; do
        [ -e $p/.gitemail ] && cat $p/.gitemail && break
        p=$(dirname $p)
      done) GIT_COMMITTER_EMAIL=$(
      p=$(pwd)
      while [[ $p != "$HOME" ]]; do
        [ -e $p/.gitemail ] && cat $p/.gitemail && break
        p=$(dirname $p)
      done) /usr/bin/git'
fi
alias g='git'

alias gpull='git pull --prune'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpush='git push origin HEAD'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gci='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

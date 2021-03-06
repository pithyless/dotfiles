zstyle ':chpwd:profiles:/Users/norbert/dev/anixe(|/|/*)'  profile anixe

# configuration for profile 'default':
chpwd_profile_default()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  # print "chpwd(): Switching to profile: default"

  export GIT_AUTHOR_EMAIL="wojtowicz.norbert@gmail.com"
  export GIT_COMMITTER_EMAIL="wojtowicz.norbert@gmail.com"
}

# configuration for profile 'anixe':
chpwd_profile_anixe()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  # print "chpwd(): Switching to profile: $profile"

  export GIT_AUTHOR_EMAIL="norbert.wojtowicz@anixe.pl"
  export GIT_COMMITTER_EMAIL="norbert.wojtowicz@anixe.pl"
}

alias gpull='git pull --prune'
alias gl="git log -n 20 --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpush='git push origin HEAD'
alias ga='git add'
alias gap='git add -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

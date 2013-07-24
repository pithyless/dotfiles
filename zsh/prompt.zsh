autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

zmodload zsh/datetime # needed for EPOCHSECONDS

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "%{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "%{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg[yellow]%}%~%{$reset_color%}"
}

ruby_version_prompt () {
  rbenv version | awk '{print $1}'
}

time_taken () {
  if (( LASTTIME > 0)); then
    let delta=${EPOCHSECONDS}-${LASTTIME}
    if (( $delta > 1 )); then
      echo "[${delta}s]"
    fi
  fi
  unset LASTTIME
}

export RPROMPT=$'$(time_taken)'
export PROMPT=$'\n$(directory_name) ($(ruby_version_prompt)) $(git_dirty)$(need_push)\n› '
set_prompt () {
  # export RPROMPT="%{$fg_bold[cyan]%}$(todo)%{$reset_color%}"
}

precmd() {
  # title "zsh" "%m" "%55<...<%~"
  print -Pn "\e]2;%~\a" # title bar prompt
  set_prompt
}

preexec() {
  LASTTIME="$EPOCHSECONDS"
}

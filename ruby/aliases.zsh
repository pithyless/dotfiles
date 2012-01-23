alias rvm-global='rvm use 1.9.2@global'

alias r='rails'
alias rc='rails console'

alias p='padrino'
alias pc='padrino console'

if [[ $IS_LINUX -eq 1 ]]; then
  alias pad-start="echo Rock \'n Roll!; bundle exec padrino start -h 0.0.0.0"
fi

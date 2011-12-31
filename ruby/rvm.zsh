if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm
    RUBY_VERSION_PREFIX=''
    ruby_version() {
        if [[ $RUBY_VERSION != "" ]]; then
            echo $RUBY_VERSION_PREFIX$RUBY_VERSION | sed s/ruby-//
        else echo ''; fi
    }
    rvm_gemset() {
      # TODO: Fix ugliness by learning ZSH!
      if [[ -n $GEM_HOME ]]; then
        GEMSET=(${(s:@:)GEM_HOME})
        if [[ -n $GEMSET[2] ]]; then
          echo @$GEMSET[2]
        else echo ''; fi
      else echo ''; fi
    }
    rvm_prompt() {
      echo $(ruby_version)$(rvm_gemset)
    }
else
    ruby_version() { echo '' }
fi

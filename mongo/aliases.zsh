if [[ $IS_LINUX -eq 1 ]]; then
  export PATH="/opt/mongodb/bin:${PATH}"
  alias mongo-up="sudo /etc/init.d/mongodb start"
  alias mongo-down="sudo /etc/init.d/mongodb stop"
fi

if [[ $IS_MAC -eq 1 ]]; then
  alias mongo-up="mongod run --logpath=/usr/local/var/log/mongodb/mongodb.log --logappend --fork --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf"
  alias mongo-down="killall mongod"
fi

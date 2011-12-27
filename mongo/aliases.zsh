if [ ${OSTYPE:0:5} = "linux" ]; then
    alias mongo-up="sudo /etc/init.d/mongodb start"
    alias mongo-down="sudo /etc/init.d/mongodb stop"
else
  if [ ${OSTYPE:0:6} = "darwin" ]; then
    alias mongo-up="mongod run --logpath=/usr/local/var/log/mongodb/mongodb.log --logappend --fork --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf"
    alias mongo-down="killall mongod"
  fi
fi

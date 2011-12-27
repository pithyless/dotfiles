if [ ${OSTYPE:0:5} = "linux" ]; then
  alias redis-up="/opt/redis/bin/redis-server /opt/redis/etc/redis.conf"
  alias redis-down="killall redis-server"
else
  if [ ${OSTYPE:0:6} = "darwin" ]; then
  fi
fi

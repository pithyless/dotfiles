if [[ $IS_LINUX -eq 1 ]]; then
  alias redis-up="/opt/redis/bin/redis-server /opt/redis/etc/redis.conf"
  alias redis-down="killall redis-server"
fi

if [[ $IS_MAC -eq 1 ]]; then
fi

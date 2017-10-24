#!/bin/bash
# nginx Startup script for the Nginx HTTP Server
# it is v.1.9.15 version.
# chkconfig: - 85 15
# description: Nginx is a high-performance web and proxy server.
# It has a lot of features, but it's not for everyone.
# processname: nginx
# pidfile: /usr/local/nginx/logs/nginx.pid
# config: /usr/local/nginx/conf/nginx.conf
nginxd=/usr/local/nginx/sbin/nginx
nginx_config=/usr/local/nginx/conf/nginx.conf
nginx_pid=/usr/local/nginx/logs/nginx.pid
nginx_lock=/var/lock/subsys/nginx
RETVAL=0
prog="nginx"
# Source function library.
. /etc/rc.d/init.d/functions
# Source networking configuration.
. /etc/sysconfig/network
# Check that networking is up.
[ ${NETWORKING} = "no" ] && exit 0
[ -x $nginxd ] || exit 0
# Start nginx daemons functions.
start() {
  nginx_is_run=`ps -ef | egrep 'nginx:\s*(worker|master)\s*process' | wc -l`
  if [ ${nginx_is_run} -gt 0 ];then
    echo "nginx already running...."
    exit 1
  fi
  echo -n $"Starting $prog: "
  daemon $nginxd -c ${nginx_config}
  RETVAL=$?
  echo
  [ $RETVAL = 0 ] && touch ${nginx_lock}
  return $RETVAL
}
# Stop nginx daemons functions.
stop() {
  echo -n $"Stopping $prog: "
  killproc $nginxd
  RETVAL=$?
  echo
  [ $RETVAL = 0 ] && rm -f ${nginx_lock} ${nginx_pid}
}
# Reload nginx config file
reload() {
  echo -n $"Reloading $prog: "
  #kill -HUP `cat ${nginx_pid}`
  killproc $nginxd -HUP
  RETVAL=$?
  echo
}
# See how we were called.
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  reload)
    reload
    ;;
  restart)
      stop
    start
    ;;
  status)
    status $prog
    RETVAL=$?
    ;;
  *)
    echo $"Usage: $prog {start|stop|restart|reload|status|help}"
    exit 1
esac

#!/bin/sh
### BEGIN INIT INFO
# Provides:          traefik
# Required-Start:    $network $remote_fs $syslog
# Required-Stop:     $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Traefik service
# Description:       Starts the Traefik service
### END INIT INFO

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Traefik service"
NAME=traefik
DAEMON=/usr/local/bin/$NAME
DAEMON_ARGS="--configFile=/etc/traefik/traefik.toml"
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

start() {
    echo "Starting $DESC: $NAME"
    start-stop-daemon --start --quiet --background --pidfile $PIDFILE --make-pidfile --exec $DAEMON -- $DAEMON_ARGS
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/$NAME
    return $RETVAL
}

stop() {
    echo "Stopping $DESC: $NAME"
    start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/$NAME
    return $RETVAL
}

status() {
    if [ -f $PIDFILE ]; then
        PID=$(cat $PIDFILE)
        if [ -d /proc/$PID ]; then
            echo "$NAME is running with PID $PID"
            return 0
        else
            echo "$NAME is not running but PID file exists"
            return 1
        fi
    else
        echo "$NAME is not running"
        return 3
    fi
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|restart|status}" >&2
    exit 3
    ;;
esac

exit 0

#!/bin/bash
#  Jakarta Tomcat server
# chkconfig: 345 91 10
# description: Starts and stops the Tomcat daemon.
#

#tomcat=/opt/tomcat/apache-tomcat-8.0.33
tomcat={{ tomcat }}
startup=$tomcat/bin/startup.sh
shutdown=$tomcat/bin/shutdown.sh

start() {
  echo -n $"Starting Tomcat service: "
  sh $startup
  echo $?
}

stop() {
  echo -n $"Stopping Tomcat service: "
  sh $shutdown
  echo $?
}

restart() {
  stop
  start
}

status() {
  ps -aef | grep apache-tomcat | grep -v tomcat6 | grep -v grep
}

# Handle the different input options
case "$1" in
start)
  start
  ;;
stop)
  stop
  ;;
status)
  status
  ;;
restart)
  restart
  ;;
*)
  echo $"Usage: $0 {start|stop|restart|status}"
  exit 1
esac

exit 0

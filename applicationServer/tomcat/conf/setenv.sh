#!/usr/bin/env bash

# Java
JAVA_HOME=/home/admin/local/jdk1.7.0_80
# memory/gc
JAVA_OPTS="-server -Xms1024m -Xmx8192m -XX:PermSize=128m -XX:MaxPermSize=1024m -XX:MaxPermSize=256m -XX:+PrintGCDateStamps  -Xloggc:./gc_80.log  -XX:+PrintGCDetails -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=./"

# PID
CATALINA_PID="$CATALINA_BASE/tomcat.pid"

# jmxremote
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9080 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1"
#!/bin/bash
# stop service
PID=$(ps -ef | grep auth-server-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo auth-server is already stopped
else
    echo kill $PID
    kill $PID
fi
nohup java -Xmx128m -Xms64m -XX:+PrintGCDetails -Xloggc:logs/gc.log -jar \
-Dspring.profiles.active=prod \
-Dspring.cloud.nacos.config.server-addr=101.43.110.173:31370 \
-Dspring.cloud.nacos.config.group=prod \
-Dspring.cloud.nacos.config.namespace=f06b54a6-ac49-4b87-aec1-ceb3e5d396b1 \
-Dspring.cloud.nacos.discovery.server-addr=101.43.110.173:31370 \
-Dspring.cloud.nacos.discovery.group=prod \
-Dspring.cloud.nacos.discovery.namespace=f06b54a6-ac49-4b87-aec1-ceb3e5d396b1 \
auth-server-0.0.1-SNAPSHOT.jar &
echo Started auth-server

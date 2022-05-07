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
echo Stoped auth-server

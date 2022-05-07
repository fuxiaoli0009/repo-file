#!/bin/bash
# stop service
PID=$(ps -ef | grep quantization-front-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo quantization-front is already stopped
else
    echo kill $PID
    kill $PID
fi
echo Stoped quantization-front

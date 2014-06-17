#!/bin/bash
mylocation=`pwd`
if [ -d "$mylocation/logs" ]
then
location=`pwd`/logs
else
mkdir -p $mylocation/logs
location=`pwd`/logs
fi
time_date=`date +%Y-%m-%d-%H-%M-%S`
proc=`ps -ef|grep java|grep mule|grep -v grep|awk '{print $2}'`
#cd -- "$(find / -name jstat  -quit 2>>/dev/null )"
cd /u01/jdk/jdk1.7.0_21/bin/ 
jstat -gcutil $proc 5s|while read pong; do echo $(date +%Y-%m-%d-%H-%M-%S) $pong;done >>$location/gc_gcutil_$time_date.txt

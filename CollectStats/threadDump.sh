#!/bin/bash
cd /soa_install
mylocation=`pwd`
if [ -d "$mylocation/logs/java" ]
then
location=`pwd`/logs/java
else
mkdir -p $mylocation/logs/java
location=`pwd`/logs/java
fi
myhostname=`hostname`
proc=`ps -ef|grep java|grep mule|grep -v linux-|grep -v grep|awk '{print $2}'`
#cd -- "$(find / -name jstack  -quit 2>>/dev/null )"
cd /u01/jdk/jdk1.7.0_21/bin/
while true
do
time_date=`date +%Y-%m-%d-%H-%M-%S`
filename=$location/threaddump_${myhostname}_${time_date}.txt
echo `echo "Time is $time_date"` >> $filename
./jstack $proc >>$filename
sleep 60
done



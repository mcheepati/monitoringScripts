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
myhostname=`hostname`
javaCount=`ps -ef|grep java|grep mule|grep -v linux-|grep -v grep|wc -l`
#echo "java number of process $javaCount"
if [ $javaCount = 1 ]
then
javaPID=`ps -ef|grep java|grep mule|grep -v linux-|grep -v grep|awk '{print $2}'`
#javaCount=`ps -ef|grep java|grep -v grep|wc -l`
#echo "java number of process $javaCount"
else
echo "Java process is not running? Please check "
echo -n "enter Java PID:"
read pid
fi

filename=./logs/memory_${myhostname}_${time_date}.txt
while true
#for i in {2..40}
do
time_date=`date +%Y-%m-%d-%H-%M-%S`
MONITOR=`free -m | grep Mem`
#echo "$javaPID"
java_process=`ps aux|grep $javaPID|grep -v grep|grep mule|awk '{print $3","$4}'`
#java_mem=`ps aux|sed -e '/$javaPID/b' -e '/$pid/b'|grep -v grep|awk '{ print $3 }'`
#echo " Java process is : $java_mem"
#echo "madhu"
MAXMEM=`echo $MONITOR|awk '{ print $2 }'`
USEDMEM=`echo $MONITOR|grep Mem |awk '{ print $3 }'`
USEDMEM1=`expr $USEDMEM \* 100`
PERCENTAGE=`expr $USEDMEM1 / $MAXMEM`
#echo `echo "$time_date,$MAXMEM,$USEDMEM,$PERCENTAGE,$java_process"` >> $filename
echo `echo " "$(date +%Y-%m-%d-%H-%M-%S)",$MAXMEM,$USEDMEM,$PERCENTAGE,$java_process,$(sar 1 1 | tail -1|awk '{print $3","$5}')"` >> $filename
#                  date                   MaxMem,UsedMem,      Used%, Java  CPU, Java mem, Process Quelength, CPU User, CPU System
#echo `echo " "$(date +%Y-%m-%d-%H-%M-%S)",$MAXMEM,$USEDMEM,$PERCENTAGE,$(vmstat 1 1|grep -v procs|grep -v r|awk '{print $1","$13","$14}')"` >> $filename
sleep 5
done

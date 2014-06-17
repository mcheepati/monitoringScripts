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
filename=./logs/netstat_${myhostname}_${time_date}.txt
echo `echo "Date,TIME_WAIT,LOSE_WAIT,Estlablished"` >>$filename
#echo `echo "Date,TIME_WAIT,LOSE_WAIT,Estlablished"` >>./logs/network/netstat_${myhostname}_${time_date}.csv
while true
#for i in {2..40}
do
#echo "while loop executing"
time_date=`date +%Y-%m-%d-%H-%M-%S`
ESTABLISHED=`netstat -a|grep ESTABLISHED|wc -l`
TIME_WAIT=`netstat -a|grep TIME_WAIT|wc -l`
CLOSE_WAIT=`netstat -a|grep CLOSE_WAIT|wc -l`
echo `echo ""$(date +%Y-%m-%d-%H-%M-%S)",$ESTABLISHED,$TIME_WAIT,$CLOSE_WAIT"` >>$filename
sleep 1
done

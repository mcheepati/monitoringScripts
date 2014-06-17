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
while true
do
for i in `iostat -x  1 1|sed '1,/Device/d'|sed '/^$/d'|awk '{print $1}'`
do
#out put format is : date,rkB/s,wkB/s await,%util
#date Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await  svctm  %util
network=`iostat -x  1 1|while read pong; do echo $(date +%Y-%m-%d-%H-%M-%S) $pong;done|grep $i`
echo `echo "$network"`>>$location/disk_${i}_${time_date}.txt
done
sleep 5
done

location=`pwd`
rm -rf $location/pid.txt
sh $location/netstat.sh &
#echo $! >> $location/pid.txt
sh $location/disk.sh &
#echo $! >>$location/pid.txt
sh $location/mem.sh &
#echo $! >>$location/pid.txt
sh $location/threadDump.sh &
#echo $! >>$location/pid.txt
#sh $location/cpu.sh &
#echo $! >>$location/pid.txt
sh $location/jvm.sh &
exit
#echo $! >>$location/pid.txt

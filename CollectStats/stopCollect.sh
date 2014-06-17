#echo "all Process"
#cat pid.txt| awk '{print $1}' | xargs kill -9
#echo "Jstst"
location=`pwd`
sh $location/archieve_log.sh &
for i in `ps -ef|grep 'disk.sh\|mem.sh\|netstat.sh\|rabbit.sh\|threadDump.sh'|grep -v grep|awk '{print $2}'`;do kill -9 $i;done
ps -ef|grep jstat|grep -v grep|awk '{print $2}' | xargs kill -9
#rm -rf pid.txt
#ps -ef|grep jstack|grep -v grep|awk '{print $2}' | xargs kill -9

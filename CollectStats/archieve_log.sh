time_date=`date +%Y-%m-%d-%H-%M-%S`
cd /home/soamgr/logs 
tar -cf log_$time_date.tar *.txt
rm -rf *.txt

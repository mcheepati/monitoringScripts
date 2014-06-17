for j in `ls -lrt |grep dump|grep -v Threa*|grep -v thread*|awk '{print $9}'`; do echo $j ;for i in `grep "async" $j|grep "amqpAsyncInboundProcessorQueueConnector"|awk -F"." '{print $4,$5,$6}'|awk '{print $1"."$2"."$3}'|sed 's/"//g'`;do echo "$i,`grep "async" $j|grep "$i"|awk -F"." '{print $4,$5,$6}'|awk '{print $7}'`";done;done >> madhu.txt


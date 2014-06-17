while true
do
madhu=`curl -k https://apiuser:apiuser@sfo-soaems-lt1:9999/api/queues| python -mjson.tool|grep "messages"|head -1`
echo  "`date +%Y-%m-%d-%H-%M-%S`,$madhu" >> /home/soamgr/logs/rabbitMQ.txt
sleep 20
done
~    

#!/bin/bash


vhost=$1

mkdir -p $vhost

aws cloudwatch get-metric-statistics --metric-name SelectThroughput --start-time 2019-09-20T00:00:00 --end-time 2019-10-03T00:00:00 --period 86400 --namespace AWS/RDS --statistics Average --dimensions Name=DBInstanceIdentifier,Value="$vhost" > ./"$vhost"/"$vhost"_selectT.json

aws cloudwatch get-metric-statistics --metric-name FreeableMemory --start-time 2019-09-20T00:00:00 --end-time 2019-10-03T00:00:00 --period 86400 --namespace AWS/RDS --statistics Average --dimensions Name=DBInstanceIdentifier,Value="$vhost" > ./"$vhost"/"$vhost"_freemem.json

aws cloudwatch get-metric-statistics --metric-name NetworkTransmitThroughput --start-time 2019-09-20T00:00:00 --end-time 2019-10-03T00:00:00 --period 86400 --namespace AWS/RDS --statistics Average  --dimensions Name=DBInstanceIdentifier,Value="$vhost" > ./"$vhost"/"$vhost"_NetworkTransmitThroughput.json

aws cloudwatch get-metric-statistics --metric-name DatabaseConnections --start-time 2019-09-20T00:00:00 --end-time 2019-10-03T00:00:00 --period 86400 --namespace AWS/RDS --statistics Average --dimensions Name=DBInstanceIdentifier,Value="$vhost" > ./"$vhost"/"$vhost"_dbcon.json

aws cloudwatch get-metric-statistics --metric-name CPUUtilization --start-time 2019-09-20T00:00:00 --end-time 2019-10-03T00:00:00 --period 86400 --namespace AWS/RDS --statistics Average --dimensions Name=DBInstanceIdentifier,Value="$vhost" > ./"$vhost"/"$vhost"_cpu.json

./convert.sh "$vhost"

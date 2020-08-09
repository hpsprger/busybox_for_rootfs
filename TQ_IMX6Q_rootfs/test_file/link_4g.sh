#/bin/bash
##!/bin/sh

cd /etc/ppp/peers/

route | grep default | grep -v grep | awk '{print $1 > "./rtab"}'

cat rtab | 
while read line
do
if [[ $line -eq "default" ]];then
   route del $line
else
  echo "not found the default route"
fi
     sleep 1
done
rm ./rtab

ps -ef|grep pppd |grep -v grep|grep -v PPID|awk '{ print $2}' | xargs kill -9

pppd call tq_init & 

cd -



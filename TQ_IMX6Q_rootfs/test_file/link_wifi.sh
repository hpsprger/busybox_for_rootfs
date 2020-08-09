#/bin/bash
##!/bin/sh

ifconfig wlan0 down

ps -ef | grep wpa_supplicant | grep -v grep | awk '{print $2}' | xargs kill -9

ps -ef | grep hostapd | grep -v grep | awk '{print $2}' | xargs kill -9

ps -ef | grep udhcpd | grep -v grep | awk '{print $2}' | xargs kill -9

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

cp /test_file/wpa_supplicant.conf /etc/wpa_supplicant.conf
ifconfig wlan0 up
wpa_supplicant -i wlan0 -Dnl80211 -c /etc/wpa_supplicant.conf &
sleep 5s
udhcpc -i wlan0


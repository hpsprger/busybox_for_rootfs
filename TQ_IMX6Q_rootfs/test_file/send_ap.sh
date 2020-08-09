#/bin/bash
##!/bin/sh

ifconfig wlan0 down

ps -ef | grep hostapd | grep -v grep | awk '{print $2}' | xargs kill -9

ps -ef | grep wpa_supplicant | grep -v grep | awk '{print $2}' | xargs kill -9

ps -ef | grep udhcpd | grep -v grep | awk '{print $2}' | xargs kill -9

cp /test_file/hostapd.conf /etc/hostapd.conf
cp /test_file/udhcpd.conf /etc/udhcpd.conf
hostapd -B /etc/hostapd.conf -f /var/log/hostap.log

ifconfig wlan0 192.168.0.2

udhcpd -f /etc/udhcpd.conf &

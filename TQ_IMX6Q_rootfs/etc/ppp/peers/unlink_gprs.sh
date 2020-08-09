#!/bin/sh


var=pppd
ps |grep $var |grep -v grep

if [ $? -eq 0 ];then
	echo $var is to stop...
	killall pppd
else
	echo sorry! $var do not run
fi



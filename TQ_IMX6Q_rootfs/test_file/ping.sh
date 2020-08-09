#!/bin/sh

#------------ping--------------#
udhcpc
echo "1" > ping.txt
ping -c 3 www.baidu.com > ping.txt
FILE="/test_file/ping.txt"
FILE_SIZE=`du $FILE | awk '{print $1}'`
if [ $FILE_SIZE -ge 4 ]
then
	echo -e "\e[1;31m-----------------net alive ping OK!!!\e[0m"
else
	echo -e "\e[1;31m-----------------bad alive ping fail!!\e[0m"
    	exit 0
fi


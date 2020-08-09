#!/bin/sh
#--------------sdcard------------------#
sdcard=`ls /dev/mmcblk1p1`
if [ ! $sdcard ]
then 
	echo "sdcard device not exist!!"
	exit 0
fi
touch /run/media/mmcblk1p1/a.txt
rm /run/media/mmcblk1p1/a.txt
RET=`echo $?`
if [ $RET -eq '1' ]
then
	echo "sdcard mount fail!!!"
	exit 0
fi
echo -e "\e[1;31m-----------------sdcard mount OK!!!\e[0m"

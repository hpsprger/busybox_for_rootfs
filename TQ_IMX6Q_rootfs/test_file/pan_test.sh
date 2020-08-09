#!/bin/sh
#--------------------------------#
dev=`ls /dev/sda1`    #用df命令查看具体挂载的设备节点，可以修改
if [ ! $dev ]
then 
	echo "sda1 device not exist!!"
	exit 0
fi
touch /run/media/sda1/a.txt
rm /run/media/sda1/a.txt
RET=`echo $?`
if [ $RET -eq '1' ]
then
	echo "disk mount fail!!!"
	exit 0
fi
#PANSIZE=`fdisk /dev/sda -l | awk '{print $5}' |head -1`
#if [ $PANSIZE -ge 50752000000 ]
#then
#	echo "--------this is hard disk!!!"
#else
#	echo "--------this USB flash disk!"
#fi
echo -e "\e[1;31m----------------- fdisk mount OK!!!\e[0m"


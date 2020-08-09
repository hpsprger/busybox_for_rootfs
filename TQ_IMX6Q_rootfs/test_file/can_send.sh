#!/bin/sh
ifconfig can0 down
ip link set can0 type can bitrate 100000 triple-sampling on
ifconfig can0 up

#send-board
cansend can0 123#DEADBEEF

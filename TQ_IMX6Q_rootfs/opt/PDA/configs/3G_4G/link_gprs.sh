#!/bin/sh


var=pppd                                                                                                              
ps |grep $var |grep -v grep                                                                                           
                                                                                                                      
if [ $? -eq 0 ];then                                                                                                  
        echo Sorry! $var is running,please to stop at first!                                                                                  
else
	pppd call tq_init & 
fi  

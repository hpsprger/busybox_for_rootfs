cd/
cd /
ls
insmod 8723bu.ko 
hostapd -B /etc/hostapd.conf -f /var/log/hostap.log
ifconfig 
ifconfig wlan0 192.168.8.1
udhcpd -f /etc/udhcpd_wifi.conf &
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo "1" > /proc/sys/net/ipv4/ip_forward
ifconfig 
cat /etc/resolv.conf 
route
ping www.baidu.com
ps
kill 797
ps
rmmod 8723bu.ko 
ls
scp service@192.168.1.162:/project_source/ccq_build/work/rtl8723/rtl8723bu/8723bu.ko ./8723bu.ko 
reboot
cd /
cp 8723bu.ko /lib/modules/imx6q/wifi/8723bu.ko 
find -name "8723bu.ko"
cp 8723bu.ko /lib/modules/4.1.15-1.0.0+g3924425/8723bu.ko 
ls
/opt/PDA/bin/tqnetset &
cat /etc/hostapd.conf 
ifconfig 
ps
kill 893
ps
kil 893
kill -9 893
ps
kill -9 825
ps
ls
exit
chmod 4755 /usr/bin/sudo
ll /usr/bin/sudo
chown root /usr/bin/sudo
sync
reboot
chmod a+s /usr/bin/sudo
exit
ll /usr/lib/sudo/sudoers.so
chown /usr/lib/sudo/sudoers.so 
chown root /usr/lib/sudo/sudoers.so 
ls /usr/lib/sudo/
ls /usr/lib/sudo/*
ll /usr/lib/sudo/*
chown root /usr/lib/sudo/*
sync
ll /usr/lib/sudo/*
exit
chown embedsky /usr/lib/sudo/group_file.la
chown embedsky /usr/lib/sudo/group_file.so
chown embedsky /usr/lib/sudo/libsudo_util.la
chown embedsky /usr/lib/sudo/libsudo_util.so.0.0.0
chown embedsky /usr/lib/sudo/sesh*
chown embedsky /usr/lib/sudo/sudo_noexec.la
chown embedsky /usr/lib/sudo/sudo_noexec.so
chown embedsky /usr/lib/sudo/sudoers.la
chown embedsky /usr/lib/sudo/system_group.so
ll /usr/lib/sudo/*
chown embedsky /usr/lib/sudo/system_group.la
exit
ll /etc/sudoers
chown root /etc/sudoers
chmod 440 /etc/sudoers
exit
ls
exit
su embedsky
exit
ls
rm imx6q/ -rf
ls
scp service@192.168.1.162:/king/ccq/project/product/open_lib_v2_new/__install_arm_gcc4_4/lib/modules/8723bu.ko /lib/modules/ 
scp service@192.168.1.162:/nfs/quan/lib/modules/imx6q/ /lib/modules/
scp -r service@192.168.1.162:/nfs/quan/lib/modules/imx6q/ /lib/modules/
scp -r service@192.168.1.162:/nfs/quan/16.04/lib/modules/imx6q/ /lib/modules/
ls
ls imx6q/
ls
insmod 8723bu.ko 
lsmod 
ls
cd /
ls
cd test_file/
ls
scp -r service@192.168.1.162:/nfs/quan/test_file/* /test_file/
./link_wifi.sh 
ifconfig 
route
route add default gw 192.168.23.1
ping -I wlan0 www.qq.com
/test_file/send_ap.sh 
ps
ps -ef|grep sudo |grep -v grep|grep -v PPID|awk '{ print $2}' | xargs kill -9
su embedsky
ll /
chown root:root -R /usr/
chown root:root -R /var/
ll /
chown embedsky:root /home/
chown embedsky:root /opt/
chown embedsky:root /test_file/
ll /
chmod a+s /usr/bin/sudo 
su embedsky
su embedsky
ls
chmod u+r ./* -R
ls
ls /proc/
ll /proc/
ls
ls /root/
sudo ls /usr/
su embedsky
chmod a+s /usr/bin/sudo
chown embedsky -R /home/
chown embedsky -R /test_file/
ll /
su embedsky
ifconfig 
ps aux |grep ssh
ping 192.168.1.162
apt-get install openssh-client
apt-get install openssh-server
apt-get remove openssh-server
ps aux |grep ssh
apt-get remove openssh-server
kill 882
ps
ps aux |grep ssh
apt-get install openssh-server
netstat -tlp
/etc/init.d/ssh restart
netstat -tlp
ll /etc/ssh/
chmod 644 /etc/ssh/* -R
ll /etc/ssh/
/etc/init.d/ssh restart
service ssh restart
service sshd restart
chmod 600 /etc/ssh/ssh_host_dsa_key
chmod 600 /etc/ssh/ssh_host_rsa_key
chmod 755 /etc/ssh/*
service ssh restart
service sshd restart
ssh-keygen -t rsa1 -f /etc/ssh/ssh_host_rsa_key
passwd root
exit
                 ls
exit

#!/bin/sh
#
# Called from udev
#
# Attempt to mount any added block devices and umount any removed devices


MOUNT="/bin/mount"
PMOUNT="/usr/bin/pmount"
UMOUNT="/bin/umount"

for line in `grep -v ^# /etc/udev/mount.blacklist`
do
	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
	then
	logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
		exit 0
	fi
done

automount() {	
	name="`basename "$DEVNAME"`"

	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
	# Silent util-linux's version of mounting auto
	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
	then
		MOUNT="$MOUNT -o silent"
	fi
	
	# If filesystem type is vfat, change the ownership group to 'disk', and
	# grant it with  w/r/x permissions.
	case $ID_FS_TYPE in
	vfat|fat)
		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
		;;
	ntfs)
        MOUNT="ntfs-3g"
		;;
	# TODO
	*)
		;;
	esac
	echo $MOUNT >> /tmp/udev.log
	echo found storge deivce: $DEVNAME > /dev/console
	fdisk $DEVNAME -l > /dev/console
	echo "try to mount $DEVNAME in /run/media/$name" > /dev/console	
	if ! $MOUNT $DEVNAME "/run/media/$name"
	then

		echo "mount $DEVNAME FAILED !" > /dev/console
		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
		rm_dir "/run/media/$name"
	else
		echo "mount $DEVNAME successed! mount on /run/media/$name" > /dev/console
		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
		touch "/tmp/.automount-$name"
	fi
}
	
rm_dir() {
	# We do not want to rm -r populated directories
	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
	then
		! test -z "$1" && rm -r "$1"
	else
		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
	fi
}

# No ID_FS_TYPE for cdrom device, yet it should be mounted
name="`basename "$DEVNAME"`"
[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`


if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
	if [ -x "$PMOUNT" ]; then
		$PMOUNT $DEVNAME 2> /dev/null
	elif [ -x $MOUNT ]; then
    		$MOUNT $DEVNAME 2> /dev/null
	fi
	
	logger "udev:now mounting"
	# If the device isn't mounted at this point, it isn't
	# configured in fstab (note the root filesystem can show up as
	# /dev/root in /proc/mounts, so check the device number too)
	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
		logger "udev: devname=$DEVNAME.mounting "
		grep -q "^$DEVNAME " /proc/mounts || automount
	else
		logger "udev: MAJOR=$MAJOR,MINOR=$MINOR"
	fi
else
	logger "udev:not cdrom"
fi


if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
	do
		$UMOUNT $mnt
		echo "$DEVNAME was remove" > /dev/console
	done
	
	# Remove empty directories from auto-mounter
	name="`basename "$DEVNAME"`"
	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
A
fi

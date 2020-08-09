TARGETS = console-setup resolvconf mountkernfs.sh pppd-dns hostname.sh udev urandom hwclock.sh networking mountdevsubfs.sh checkroot.sh mountall-bootclean.sh mountall.sh bootmisc.sh procps checkroot-bootclean.sh kmod checkfs.sh mountnfs.sh mountnfs-bootclean.sh
INTERACTIVE = console-setup udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
urandom: hwclock.sh
hwclock.sh: mountdevsubfs.sh
networking: resolvconf mountkernfs.sh urandom procps
mountdevsubfs.sh: mountkernfs.sh udev
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
mountall-bootclean.sh: mountall.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh
bootmisc.sh: mountall-bootclean.sh udev checkroot-bootclean.sh mountnfs-bootclean.sh
procps: mountkernfs.sh udev
checkroot-bootclean.sh: checkroot.sh
kmod: checkroot.sh
checkfs.sh: checkroot.sh
mountnfs.sh: networking
mountnfs-bootclean.sh: mountnfs.sh

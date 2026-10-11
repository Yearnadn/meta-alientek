SUMMARY = "ALIENTEK i.MX6ULL image"

inherit core-image

IMAGE_NAME = "alientek-image"
IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-core-ssh-openssh \
    vim ethtool \
    libubootenv-bin \
    rsync \
    e2fsprogs-resize2fs \
    atk-flash \
"

IMAGE_FSTYPES = "ext4 tar.bz2"
IMAGE_ROOTFS_SIZE ?= "131072"
SERIAL_CONSOLES = "115200;ttymxc0"

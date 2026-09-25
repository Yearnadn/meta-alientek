SUMMARY = "Minimal image for IMX6ULL ALIENTEK"

inherit core-image

IMAGE_NAME = "alientek-image"


IMAGE_INSTALL = " \
    packagegroup-core-boot \
    packagegroup-core-ssh-openssh \
    vim \
"

IMAGE_FSTYPES = "ext4 tar.bz2"

IMAGE_ROOTFS_SIZE ?= "131072"

# IMAGE_VERSION_SUFFIX = ""

SERIAL_CONSOLES = "115200;ttymxc0"

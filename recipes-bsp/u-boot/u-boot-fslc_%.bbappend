FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://0001-board-imx6ull_alientek-add-initial-board-support.patch \
    file://0001-board-imx6ull_alientek-add-ATK7016-LCD-support.patch \
    file://0001-mx6ull_atom-Disable-network-support-to-reduce-U-Boot.patch \
"
do_configure:prepend() {
    rm -f ${S}/.config
    rm -rf ${S}/include/config
}

UBOOT_CONFIG[sd] = "imx6ull_alientek_config,sdcard"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://0001-board-imx6ull_alientek-add-initial-board-support.patch"

UBOOT_CONFIG[sd] = "imx6ull_alientek_config,sdcard"
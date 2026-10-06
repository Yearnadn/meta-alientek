FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://imx6ull-alientek.dts \
    file://imx6ull-alientek.dtsi \
    file://defconfig \
"
do_configure:append() {
    cp -f ${WORKDIR}/imx6ull-alientek.dts  ${S}/arch/arm/boot/dts/
    cp -f ${WORKDIR}/imx6ull-alientek.dtsi ${S}/arch/arm/boot/dts/

    if ! grep -q "imx6ull-alientek.dtb" ${S}/arch/arm/boot/dts/Makefile; then
        echo 'dtb-y += imx6ull-alientek.dtb' >> ${S}/arch/arm/boot/dts/Makefile
    fi
}

KERNEL_DEVICETREE:forcevariable = "imx6ull-alientek.dtb"
SUMMARY = "ATK A/B firmware update script"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "file://atk-flash-update"

S = "${WORKDIR}"
RDEPENDS:${PN} += "bash"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/atk-flash-update ${D}${bindir}/atk-flash-update
}

FILES:${PN} += "${bindir}/atk-flash-update"
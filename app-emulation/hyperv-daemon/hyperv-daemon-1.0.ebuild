# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="init script for the hyper-v daemon in gentoo-sources tools/hv"
HOMEPAGE="https://github.com/dl200010/hyperv-daemon"
SRC_URI="https://github.com/dl200010/hyperv-daemon/releases/download/v${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
BDEPEND="${RDEPEND}"

src_install() {
	default
	mkdir ${D}/etc
	cp -r ${S}/gentoo/etc/init.d ${D}/etc
}

pkg_postinst() {
	chmod 755 /etc/init.d/hv_kvp_daemon

	elog 'Install hyper-v daemon from /usr/src/linux/tools/hv with make install'
	elog 'Use "rc-update add hv_kvp_daemon default" to auto start when booting up.'
}

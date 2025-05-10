# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Leak Protection (Fail Safe Mechanism) for (Open)VPN for Gentoo"
HOMEPAGE="https://github.com/dl200010/vpn-firewall"
SRC_URI="https://github.com/dl200010/vpn-firewall/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	net-firewall/iptables:0=
	net-vpn/openvpn:0=
"
BDEPEND="${RDEPEND}"

src_install() {
	default
	mkdir ${D}/etc
	cp -r ${S}/gentoo/etc/init.d ${D}/etc
	cp -r ${S}/gentoo/etc/vpnfirewall ${D}/etc
}

pkg_postinst() {
	chmod 755 /etc/init.d/vpnfirewall
	chmod 644 /etc/vpnfirewall/config
}
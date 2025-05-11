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
	sys-libs/glibc:0=
	sys-apps/coreutils:0=
	sys-apps/grep:0=
	sys-apps/sed:0=
	sys-apps/gawk:0=
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

	elog 'Edit /etc/vpnfirewall/config to point to your openvpn.conf file and your local IPv4 network.'
	elog 'Edit /etc/init.d/openvpn to add "need vpnfirewall" to the end of "depend()".'
	elog 'Use "/etc/init.d/vpnfirewall start" to start right away.'
	elog 'Use "rc-update add vpnfirewall default" to auto start when booting up.'
}
# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A compact getty program"
HOMEPAGE="http://riemann.fmi.uni-sofia.bg/ngetty/"
SRC_URI="http://riemann.fmi.uni-sofia.bg/ngetty/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="dev-libs/libowfat
	dev-libs/dietlibc"

src_compile() {
	emake CFLAGS="${CFLAGS} -I/usr/include/libowfat" \
		LDFLAGS="${LDFLAGS}" DIET="diet" || die

}

src_install () {
	dodir "/usr/share/man/man8" "/sbin" "/etc/ngetty" "/usr/bin"
	emake install DESTDIR="${D}" || die
	dodoc CHANGES README
}

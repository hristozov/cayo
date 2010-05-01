# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


DESCRIPTION="a small replacement of init"
HOMEPAGE="http://riemann.fmi.uni-sofia.bg/ninit/"
SRC_URI="http://riemann.fmi.uni-sofia.bg/ninit/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libowfat
		dev-libs/dietlibc"
RDEPEND="${DEPEND}"

src_compile() {
	emake CFLAGS="${CFLAGS} -I/usr/include/libowfat" \
		LDFLAGS="${LDFLAGS}" DIET="diet" || die
}

src_install() {
	mkdir -p "${D}/usr/share/man" || die
	emake install DESTDIR="${D}" || die
	dodoc CHANGES README
}


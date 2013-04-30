EAPI=4
inherit qt4-r2 eutils

DESCRIPTION="qmule edonkey2000 and bittorent client"
HOMEPAGE="https://github.com/qmule/qmule"
SLOT=0
SRC_URI="https://github.com/qmule/qmule/archive/release-1.0.0.8-imod.tar.gz -> ${P}.tar.gz"

#todo set license
LICENSE="Oslik"

KEYWORDS="amd64 x86"


QT_MIN="4.6.1"

DEPEND="=net-libs/rb_libtorrent-0.15.10
	>=dev-qt/qtcore-${QT_MIN}:4
	X? ( >=dev-qt/qtgui-${QT_MIN}:4 )
	dbus? ( >=dev-qt/qtdbus-${QT_MIN}:4 )
	>=dev-libs/boost-1.49.0
	<dev-libs/boost-1.50.0
	>=dev-libs/boost-logging-2.0.0
	dev-qt/qtwebkit
	>=net-libs/libed2k-0.2
	virtual/pkgconfig"

RDEPEND="${CDEPEND}
	geoip? ( dev-libs/geoip )"


RDEPEND="${DEPEND}"
IUSE="debug +X geoip dbus"

S="${WORKDIR}/qmule-release-1.0.0.8-imod"

src_configure() {
	#todo to Makefile
	lrelease "${S}"/src/src.pro
	#todo use flag options
	eqmake4 "${S}"/qMule.pro PREFIX=/usr/
}
src_install() {
	qt4-r2_src_install
	cp src/Icons/emule/newmule.png src/Icons/emule/qmule.png
	doicon -s 32 src/Icons/emule/qmule.png
	make_desktop_entry ${PN} "qMule"
	# qmule "Network" || die "failed desktop entry"
}
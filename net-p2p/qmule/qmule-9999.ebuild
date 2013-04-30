EAPI=4
inherit qt4-r2 eutils git-2

EGIT_REPO_URI="git://github.com/qmule/qmule.git"
EGIT_BRANCH="develop"

DESCRIPTION="qmule edonkey2000 and bittorent client"
HOMEPAGE="https://github.com/qmule/qmule"
SLOT=0

#todo set license
LICENSE="Oslik"

KEYWORDS="~amd64 ~x86"


QT_MIN="4.6.1"

DEPEND="=net-libs/rb_libtorrent-0.15.10
	>=dev-qt/qtcore-${QT_MIN}:4
	X? ( >=dev-qt/qtgui-${QT_MIN}:4 )
	dbus? ( >=dev-qt/qtdbus-${QT_MIN}:4 )
	>=dev-libs/boost-1.49.0
	<dev-libs/boost-1.50.0
	>=dev-libs/boost-logging-2.0.0
	dev-qt/qtwebkit
	>=net-libs/libed2k-9999
	virtual/pkgconfig"

RDEPEND="${CDEPEND}
	geoip? ( dev-libs/geoip )"


RDEPEND="${DEPEND}"
IUSE="debug +X geoip dbus"

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
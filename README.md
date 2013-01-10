qMule ebuilds
==============

Gentoo overlay for qmule - Edonkey/Bittorent client on QT


##Layman help

1. Check **app-portage/layman** compiled with **git** use flag
2. Add overlay url to layman.cfg "overlays" section:
        
        https://raw.github.com/qmule/gentoo-overlay/master/overlay.xml

3. Fetch and add qmule overlay

        layman -f -a qmule

4. Install qmule

        emerge -av qmule

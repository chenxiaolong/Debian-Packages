#!/bin/bash

FREETYPE_VER=$(dpkg-parsechangelog -ldebian/changelog | grep Version | sed -n 's/^.* \(.*\)-.*$/\1/p')

if [ ! -f freetype-${FREETYPE_VER}.tar.bz2 ]; then
  wget "http://download.savannah.gnu.org/releases/freetype/freetype-${FREETYPE_VER}.tar.bz2"
fi

if [ -d freetype-${FREETYPE_VER} ]; then
  rm -rvf freetype-${FREETYPE_VER}
fi

tar jxvf freetype-${FREETYPE_VER}.tar.bz2

cd freetype-${FREETYPE_VER}

cp -rv ../debian/ .

debuild -us -uc -b

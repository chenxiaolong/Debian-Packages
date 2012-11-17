#!/bin/bash

INFINALITY="http://www.infinality.net/fedora/linux/zips/fontconfig-infinality-1-20111223_2.tar.bz2"

if [ ! -f ${INFINALITY##*/} ]; then
  wget "${INFINALITY}"
fi

if [ -d fontconfig-infinality-1 ]; then
  rm -rvf fontconfig-infinality-1
fi

mkdir fontconfig-infinality-1
cd fontconfig-infinality-1

tar jxvf ../${INFINALITY##*/}

cp -rv ../debian/ .

debuild -us -uc -b

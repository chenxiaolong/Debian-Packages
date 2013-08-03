. /etc/default/freetype-infinality

DEB_HOST_MULTIARCH=$(dpkg-architecture -qDEB_HOST_MULTIARCH)

if [ "x${INFINALITY}" = "xtrue" ]; then
  EXISTING=$(echo ${LD_PRELOAD} | grep "freetype.so" | grep -v "infinality" | wc -l)
  if [ "${EXISTING}" -eq 0 ]; then
    export LD_PRELOAD="/usr/lib/${DEB_HOST_MULTIARCH}/freetype-infinality/libfreetype.so.6.8.1:${LD_PRELOAD}"
  fi
fi

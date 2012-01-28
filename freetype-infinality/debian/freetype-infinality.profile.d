source /etc/default/infinality

DEB_HOST_MULTIARCH=$(dpkg-architecture -qDEB_HOST_MULTIARCH)

if [[ "${INFINALITY}" == true ]]; then
  EXISTING=$(echo ${LD_PRELOAD} | grep "freetype.so" | grep -v "infinality" | wc -l)
  if [[ "${EXISTING}" == 0 ]]; then
    export LD_PRELOAD="/usr/lib/${DEB_HOST_MULTIARCH}/freetype-infinality/libfreetype.so.6.8.0:${LD_PRELOAD}"
  fi
fi

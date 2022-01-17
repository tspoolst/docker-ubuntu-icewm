#[of]:install vbox-remote-0.2.0
RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/tspoolst/vbox-remote/archive/v0.2.2.tar.gz && \
  tar zvxf /tmp/v0.2.2.tar.gz && \
  mkdir -p /usr/local && \
  mv -f vbox-remote-0.2.2 /usr/local/vbox-remote && \
  rm -rf /tmp/*
#[cf]

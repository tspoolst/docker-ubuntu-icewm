#[of]:install bash-5.0.0
RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL bison byacc && \
  PACKAGE_CLEAN
RUN ${WGET} http://`'M4_LOCALCACHE`'ftp.gnu.org/gnu/bash/bash-5.0.tar.gz && \
  cd /tmp/ && \
  tar zxf bash-5.0.tar.gz && \
  cd /tmp/bash-5.0/ && \
  ./configure --prefix=/usr --exec_prefix=/usr && \
  make install-strip && \
  bash -c '[[ -L "/bin" ]] || ln -svf /usr/bin/bash /bin/bash' && \
  cd .. && \
  rm -rf /tmp/*
#[cf]

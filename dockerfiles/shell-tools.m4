#[of]:install shell tools
RUN ${WGET} http://`'M4_LOCALCACHE`'scriptvoodoo.org/pub/projects/shutils/shutils-0.0.1.tar.bz2 && \
  mkdir -p /packages && \
  tar jxf /tmp/shutils-0.0.1.tar.bz2 -C /packages && \
  cd /packages && \
  ln -sv shutils-0.0.1/linkit && \
  ./linkit shutils-0.0.1 && \
  rm -rf /tmp/*
#[cf]

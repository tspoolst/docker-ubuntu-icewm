#[of]:install git-2.23.0
RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL gettext asciidoc xmlto tk \
ifelse(DISTRO, `ubuntu',
`    libcurl4-openssl-dev zlib1g-dev libssl-dev libexpat1-dev && \'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`    libcurl-devel zlib-devel openssl-devel expat-devel && \'
)dnl
  PACKAGE_CLEAN

# RUN add-apt-repository -y ppa:git-core/ppa
# RUN apt-get update
# RUN apt-get install -y \
#   git

RUN ${WGET} http://`'M4_LOCALCACHE`'mirrors.edge.kernel.org/pub/software/scm/git/git-2.23.0.tar.gz && \
  cd /tmp/ && \
  tar zxf git-2.23.0.tar.gz && \
  cd /tmp/git-2.23.0/ && \
  ./configure --prefix=/usr --exec_prefix=/usr --with-curl --with-expat --with-tcltk && \
  make && \
  make man && \
  make strip && \
  make install && \
  make install-man && \
  cd .. && \
  rm -rf /tmp/*
COPY os/completions-git /usr/share/bash-completion/completions/git
RUN ln -sv git /usr/share/bash-completion/completions/gitk
#[cf]

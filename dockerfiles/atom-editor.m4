#[of]:add the Atom.io repo
ifelse(DISTRO, `ubuntu',
`RUN curl -sL http://`'M4_LOCALCACHE`'packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - && \
  echo "deb [arch=amd64] http://`'M4_LOCALCACHE`'packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`RUN rpm --import http://`'M4_LOCALCACHE`'packagecloud.io/AtomEditor/atom/gpgkey
COPY os/atom.repo /etc/yum.repos.d/'
)dnl
RUN /update-repo-pointers.sh
RUN PACKAGE_UPDATE
RUN PACKAGE_INSTALL atom && \
  PACKAGE_CLEAN
#[cf]

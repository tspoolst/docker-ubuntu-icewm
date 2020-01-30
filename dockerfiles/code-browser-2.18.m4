#[of]:code-browser-2.18
ifelse(DISTRO, `ubuntu',
`RUN dpkg --add-architecture i386 && \
  PACKAGE_UPDATE && \
  PACKAGE_INSTALL libgtk2.0-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 && \'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`RUN rpm -Uvh http://`'M4_LOCALCACHE`'li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm && \
  /update-repo-pointers.sh && \
  PACKAGE_UPDATE && \
  PACKAGE_INSTALL gtk2.i686 pango.i686 pangox-compat-0.0.2-2.el7.i686 && \'
)dnl
  PACKAGE_CLEAN

COPY os/code-browser-2.18-pkg.tar.bz2 /tmp/
RUN tar jxvf /tmp/code-browser-2.18-pkg.tar.bz2 -C /
RUN rm -f /tmp/code-browser-2.18-pkg.tar.bz2
RUN cd /packages && \
  ./linkit code-browser-2.18
#[cf]

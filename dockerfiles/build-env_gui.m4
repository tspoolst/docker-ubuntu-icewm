ifelse(DISTRO, `ubuntu', `define(`FROM',DOCKER_REPO`/build-env_ubuntu-16_cmdline:'WORKBENCH_VERSION)dnl', `dnl')
ifelse(DISTRO, `centos', `define(`FROM',DOCKER_REPO`/build-env_centos-7_cmdline:'WORKBENCH_VERSION)dnl', `dnl')
ifelse(DISTRO, `rhel', `define(`FROM',DOCKER_REPO`/build-env_rhel-7.6_cmdline:'WORKBENCH_VERSION)dnl', `dnl')
include(`header.m4')dnl

# include(`atom-editor.m4')dnl
# include(`google-chrome.m4')dnl

# ifelse_or(DISTRO, `centos', `rhel',
# `RUN rpm -Uvh http://`'M4_LOCALCACHE`'github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-30-1.noarch.rpm && \
#   /update-repo-pointers.sh && \
#   PACKAGE_CLEAN'
# )dnl

ifelse_or(DISTRO, `centos', `rhel',
`RUN PACKAGE_INSTALL libglade2 pangox-compat
RUN ${WGET} "http://`'M4_LOCALCACHE`'downloads.sourceforge.net/project/rox/rox/2.10/rox-filer-linux-x86_64-2.10.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Frox%2Ffiles%2Frox%2F2.10%2Frox-filer-linux-x86_64-2.10.tar.bz2%2Fdownload&ts=1577451708" -O /tmp/rox-filer-linux-x86_64-2.10.tar.bz2
RUN tar jxf /tmp/rox-filer-linux-x86_64-2.10.tar.bz2 -C /usr/local/
RUN echo "APP_DIR=/usr/local/rox-filer-linux-x86_64-2.10/ROX-Filer /usr/local/rox-filer-linux-x86_64-2.10/ROX-Filer/ROX-Filer \"\$@\"" > /usr/bin/rox && \
chmod 755 /usr/bin/rox && \
ln -sv rox /usr/bin/rox-filer'
)dnl

RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    ifelse(DISTRO, `ubuntu', `rox-filer \', `dnl')
    nedit \
    xterm rxvt-unicode && \
  PACKAGE_CLEAN

include(`code-browser-2.18.m4')dnl

COPY os/skel-gui/ /
RUN bash -c 'cp -av /etc/skel/{.[[:alnum:]]*,*} /root/ ; \
  chown root.root /root -Rc'

ifelse(DISTRO`:'DISTRO_VER, `ubuntu:16.04', `define(`FROM',DOCKER_REPO`/build-env_ubuntu-16.04_gui:'WORKBENCH_VERSION)dnl' ,`dnl')
ifelse(DISTRO`:'DISTRO_VER, `ubuntu:20.04', `define(`FROM',DOCKER_REPO`/build-env_ubuntu-20.04_gui:'WORKBENCH_VERSION)dnl' ,`dnl')
ifelse(DISTRO`:'DISTRO_VER, `centos:7', `define(`FROM',DOCKER_REPO`/build-env_centos-7_gui:'WORKBENCH_VERSION)dnl' ,`dnl')
ifelse(DISTRO`:'DISTRO_VER, `rhel:7.6', `define(`FROM',DOCKER_REPO`/build-env_rhel-7.6_gui:'WORKBENCH_VERSION)dnl', `dnl')
include(`header.m4')dnl

RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL  \
    icewm \
    fbpanel \
    xrdp && \
  PACKAGE_CLEAN

ifelse(DISTRO`:'DISTRO_VER, `ubuntu:16.04',
`RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL  \
    icewm-themes && \
  PACKAGE_CLEAN'
)dnl

COPY os/packages-icewm.tar.bz2 /tmp/
RUN tar jxf /tmp/packages-icewm.tar.bz2 -C / && \
  rm -f /tmp/packages-icewm.tar.bz2
RUN cd /packages && \
  ./linkit iceicons-0.10.0 && \
  ./linkit icewm-themes-030820

RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/tspoolst/dlist/archive/v1.0.4.tar.gz && \
  tar zxf /tmp/v1.0.4.tar.gz -C /packages && \
  rm -f /tmp/v1.0.4.tar.gz
RUN cd /packages && \
  ./linkit dlist-1.0.4

COPY os/skel-desktop-icewm/ /
RUN bash -c 'cp -av /etc/skel/{.[[:alnum:]]*,*} /root/ ; \
  chown root.root /root -Rc'

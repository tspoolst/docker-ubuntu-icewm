ifelse(DISTRO`:'DISTRO_VER, `ubuntu:16.04', `define(`FROM',`ubuntu:16.04')dnl', `dnl')
ifelse(DISTRO`:'DISTRO_VER, `ubuntu:20.04', `define(`FROM',`ubuntu:20.04')dnl', `dnl')
ifelse(DISTRO`:'DISTRO_VER, `centos:7', `define(`FROM',`centos:7')dnl', `dnl')
ifelse(DISTRO`:'DISTRO_VER, `rhel:7.6', `define(`FROM',`10.10.61.17:5000/rhel7.6:layer1-v0.1.0')dnl', `dnl')
include(`header.m4')dnl

COPY os/keyboard /etc/default/keyboard

ifelse(DISTRO, `ubuntu',
`RUN touch /etc/apt/sources.list.d/empty.list'
)dnl
COPY os/update-repo-pointers.sh /

ifelse(DISTRO, `rhel',
`RUN if [[ -e /etc/oracle-release ]]; then yum -y remove uptrack rhn-client-tools; else yum -y remove subscription-manager rhn-client-tools; fi; :
RUN rm -f /etc/yum.repos.d/*.repo
COPY os/rhel-yum/ /etc/'
)dnl

COPY os/bhttpget.bsh /
RUN /update-repo-pointers.sh

RUN echo Etc/UTC \> /etc/localtime && \
  PACKAGE_UPDATE && \
  PACKAGE_INSTALL tzdata && \
  ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
  PACKAGE_CLEAN

include(`repos.m4')dnl

#[c]ifelse(DISTRO`:'DISTRO_VER, `ubuntu:20.04', `
#[c]`RUN unminimize'
#[c])dnl

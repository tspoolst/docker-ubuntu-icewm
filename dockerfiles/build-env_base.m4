ifelse(DISTRO, `ubuntu', `define(`FROM',`ubuntu:16.04')dnl', `dnl')
ifelse(DISTRO, `centos', `define(`FROM',`centos:7')dnl', `dnl')
ifelse(DISTRO, `rhel', `define(`FROM',`10.10.61.17:5000/rhel7.6:layer1-v0.1.0')dnl', `dnl')
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

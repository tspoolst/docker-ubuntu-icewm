#[of]:prep repos
ifelse_or(DISTRO, `centos', `rhel', `##we like man pages
RUN lc_confFile="$(cat /etc/yum.conf)";echo "${lc_confFile}" | grep -v ^tsflags > /etc/yum.conf'
)dnl

ifelse(DISTRO, `ubuntu', `RUN rm -fv /etc/apt/apt.conf.d/docker-clean', `dnl')

RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    net-tools \
ifelse(DISTRO, `ubuntu', `    apt-transport-https \
    apt-utils \
    apt-file \'
)dnl
ifelse_or(DISTRO, `centos', `rhel', `   deltarpm \
    initscripts \
    man \', `dnl')
  && \
  PACKAGE_CLEAN
#[cf]

#[of]:install base packages
#[c]ifelse(DISTRO, `ubuntu',
ifelse(DISTRO`:'DISTRO_VER, `ubuntu:16.04',
`RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    sudo dialog apt-file dmidecode man bzip2 bsdtar zip unzip whois \
    bash-completion ncdu htop less tree file screen lsof \
    openssh-server openssh-client sshfs \
    vim mc hexedit rsync wget curl lftp links lynx dnsutils \
    iputils-ping \
    nmap tcpdump iftop jnettop \
    make gcc patch \
    ruby ruby-dev python-pip python3-pip jq \
    software-properties-common \
    coreutils hostname net-tools iproute2 \
    psmisc \
    traceroute iperf && \
  PACKAGE_CLEAN'
)dnl
#[c]bsdtar python-pip iproute
ifelse(DISTRO`:'DISTRO_VER, `ubuntu:20.04',
`RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    sudo dialog apt-file dmidecode man bzip2 libarchive-tools zip unzip whois \
    bash-completion ncdu htop less tree file screen lsof \
    openssh-server openssh-client sshfs \
    vim mc hexedit rsync wget curl lftp links lynx dnsutils \
    iputils-ping \
    nmap tcpdump iftop jnettop \
    make gcc patch \
    ruby ruby-dev python2 python3-pip jq \
    software-properties-common \
    coreutils hostname net-tools iproute2 \
    psmisc \
    traceroute iperf && \
  PACKAGE_CLEAN'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`RUN PACKAGE_INSTALL epel-release && \
  /update-repo-pointers.sh

RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    coreutils sysvinit-tools hostname net-tools iproute \
    sudo psmisc dialog dmidecode man man-pages bzip2 bsdtar zip unzip whois \
    bash bash-completion bash-completion-extras util-linux \
    ncdu htop findutils tree file screen lsof \
    openssh-server openssh-clients sshfs perl-Digest-SHA \
    cronie \
    vim mc hexedit rsync wget lftp links lynx \
    bind-utils traceroute iputils nmap iperf tcpdump iftop jnettop \
    make gcc-4.8.5 patch \
    ruby ruby-devel python2-pip python3-pip python-devel jq && \
  PACKAGE_CLEAN'
)dnl

RUN mkdir -p /usr/share/bash-completion/completions

ifelse(DISTRO`:'DISTRO_VER, `ubuntu:20.04',
`RUN ${WGET} http://`'M4_LOCALCACHE`'bootstrap.pypa.io/pip/2.7/get-pip.py && \
  cd /tmp/ && \
  python2 get-pip.py && \
  rm -rf /tmp/*'
)dnl

ENV PYTHONWARNINGS ignore
RUN pip2 install --upgrade pip==20.3.4
RUN pip2 install --upgrade jinja2==2.11.3 pyyaml==5.4.1 requests jenkinsapi==0.3.9
RUN pip3 install --upgrade pip==20.3.4
RUN pip3 install --upgrade pyyaml requests yq jenkinsapi==0.3.9
ifelse(DISTRO, `ubuntu',
`RUN rm -fv /usr/bin/pip*'
)dnl

RUN rm -f /etc/ssh/ssh_host_*; :
#[cf]

# gcc-4.8.5-36.el7 \
# util-linux \
# E: Unable to locate package python2-pip
# E: Unable to locate package sysvinit-tools
# E: Unable to locate package man-pages
# E: Unable to locate package bash-completion-extras
# E: Unable to locate package perl-Digest-SHA
# E: Unable to locate package bind-utils
# E: Unable to locate package iputils

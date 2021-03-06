#[of]:install base packages
ifelse(DISTRO, `ubuntu',
`RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL \
    sudo dialog apt-file dmidecode man bzip2 zip unzip whois \
    bash-completion ncdu htop less tree file screen lsof \
    openssh-server openssh-client sshfs \
    vim mc hexedit rsync wget lftp links lynx dnsutils \
    iputils-ping \
    nmap tcpdump iftop jnettop \
    make gcc \
    ruby ruby-dev python-pip python3-pip jq \
    software-properties-common \
    coreutils hostname net-tools iproute \
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
    sudo psmisc dialog dmidecode man man-pages bzip2 zip unzip whois \
    bash bash-completion bash-completion-extras util-linux \
    ncdu htop tree file screen lsof \
    openssh-server openssh-clients sshfs perl-Digest-SHA \
    cronie \
    vim mc hexedit rsync wget lftp links lynx \
    bind-utils traceroute iputils nmap iperf tcpdump iftop jnettop \
    make gcc-4.8.5 \
    ruby ruby-devel python2-pip python3-pip jq && \
  PACKAGE_CLEAN'
)dnl

RUN pip3 install --upgrade pip pyyaml requests

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

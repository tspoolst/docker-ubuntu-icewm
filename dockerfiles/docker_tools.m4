#[of]:install docker and tools
#docker-ce-19.03.1, docker-compose-1.24.1

RUN echo "docker:x:0:" >> /etc/group

ifelse(DISTRO, `ubuntu',
`RUN curl -fsSL http://'M4_LOCALCACHE`download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable" && \
  /update-repo-pointers.sh
RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL docker-ce-cli=$(apt-cache madison docker-ce-cli | grep -oE ''`[^[:blank:]]+19\.03\.1[^[:blank:]]+''`) && \'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`COPY os/docker-ce.repo /etc/yum.repos.d/
RUN /update-repo-pointers.sh
RUN PACKAGE_UPDATE && \
  PACKAGE_INSTALL docker-ce-cli-19.03.1 && \'
)dnl
  PACKAGE_CLEAN

RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64 -O /usr/bin/docker-compose && \
  chmod 755 /usr/bin/docker-compose
# RUN ${WGET} http://${SRCDIR_PACKAGES}/container-diff-0.15.0-linux-amd64 -O /usr/bin/container-diff && \
#   chmod +x /usr/bin/container-diff
# RUN ${WGET} http://${SRCDIR_PACKAGES}/dive_0.8.0_linux_amd64.rpm && \
#   yum install -y /tmp/dive_0.8.0_linux_amd64.rpm && \
#   rm -rf /tmp/* && \
#   yum clean all && \
#   rm -rf /var/lib/yum/{repos,yumdb,history} /var/cache/yum/*
#[cf]

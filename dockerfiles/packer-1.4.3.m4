#[of]:install packer-1.4.3
RUN cd /tmp && \
  ${WGET} http://`'M4_LOCALCACHE`'releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip && \
  unzip /tmp/packer_1.4.3_linux_amd64.zip -d /usr/bin/ && \
  rm -f /tmp/*
#[cf]

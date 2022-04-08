#[of]:install vagrant-2.2.5
#disable vagrant upgrade check
ENV VAGRANT_CHECKPOINT_DISABLE=yes

ifelse(DISTRO, `ubuntu',
`RUN ${WGET} http://`'M4_LOCALCACHE`'releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb && \
  PACKAGE_UPDATE && \
  PACKAGE_INSTALL /tmp/vagrant_2.2.5_x86_64.deb libreadline-dev && \
  PACKAGE_CLEAN && \
  rm -f /tmp/vagrant_2.2.5_x86_64.deb'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`RUN ${WGET} http://`'M4_LOCALCACHE`'releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.rpm && \
  PACKAGE_INSTALL /tmp/vagrant_2.2.5_x86_64.rpm && \
  PACKAGE_CLEAN && \
  rm -f /tmp/vagrant_2.2.5_x86_64.rpm'
)dnl
RUN ${WGET} http://`'M4_LOCALCACHE`'raw.github.com/kura/vagrant-bash-completion/master/etc/bash_completion.d/vagrant -O /usr/share/bash-completion/completions/vagrant

RUN vagrant plugin install vagrant-scp
RUN vagrant plugin install vagrant-vbox-snapshot
RUN vagrant plugin install vagrant-hostmanager
RUN vagrant plugin install pry-byebug

#[cf]

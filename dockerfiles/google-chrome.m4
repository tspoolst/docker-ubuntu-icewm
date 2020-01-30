#[of]:add the google chrome repo
ifelse(DISTRO, `ubuntu',
`RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb [arch=amd64] http://`'M4_LOCALCACHE`'dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
)dnl
ifelse_or(DISTRO, `centos', `rhel',
`COPY os/google-chrome.repo /etc/yum.repos.d/'
)dnl
RUN /update-repo-pointers.sh
RUN PACKAGE_UPDATE
RUN PACKAGE_INSTALL google-chrome-stable && \
  PACKAGE_CLEAN
#[cf]

#name of container: workbench
#name of image: workbench-layer3
#versison of image: 0.2.0

#docker build -t workbench-layer3:0.2.0 .

FROM tspoolst/docker-ubuntu-icewm:layer2-commandline-0.2.0
#FROM workbench-layer2:0.2.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

COPY keyboard /etc/default/keyboard

#[of]:add the Xpra repo
RUN wget -q -O - https://xpra.org/gpg.asc | apt-key add - && \
  wget -q -O - https://xpra.org/repos/xenial/xpra.list > /etc/apt/sources.list.d/xpra.list
#[cf]
#[of]:add the Atom.io repo
RUN curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - && \
  echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
#[cf]
#[of]:add the google chrome repo
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
#[cf]

RUN apt-get update && \
  apt-get install -y -q \
    xpra \
    rox-filer \
    nedit atom \
    xterm rxvt-unicode \
    google-chrome-stable && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*

COPY packages-xapps.tar.bz2 /
RUN tar jxvf /packages-xapps.tar.bz2 -C /
RUN rm -f /packages-xapps.tar.bz2
RUN cd /packages && \
  ./linkit docker-code-browser-2.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

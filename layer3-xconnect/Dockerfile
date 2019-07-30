#name of container: workbench
#name of image: workbench-layer3
#version of image: v0.4.0

#docker build -t workbench-layer3:v0.4.0 .

FROM tspoolst/docker-ubuntu-icewm:layer2-v0.4.0
#FROM workbench-layer2:v0.4.0
MAINTAINER Trent Spoolstra  "tspoolst@gmail.com"

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

COPY keyboard /etc/default/keyboard

# #[of]:add the Xpra repo
# RUN wget -q -O - https://xpra.org/gpg.asc | apt-key add - && \
#   wget -q -O - https://xpra.org/repos/xenial/xpra.list > /etc/apt/sources.list.d/xpra.list
# #[cf]
#[of]:add the Atom.io repo
RUN curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - && \
  echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
#[cf]
#[of]:add the google chrome repo
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
#[cf]

# xpra \
RUN dpkg --add-architecture i386 && \
  apt-get update && \
  echo Etc/UTC \> /etc/localtime && \
  apt-get install -y -q tzdata && \
  ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
  apt-get install -y -q libgtk2.0-0:i386 libpangox-1.0-0:i386 libpangoxft-1.0-0:i386 && \
  apt-get install -y -q \
    rox-filer \
    nedit atom \
    xterm rxvt-unicode \
    google-chrome-stable && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*

COPY code-browser-2.18-pkg.tar.bz2 /
RUN tar jxvf /code-browser-2.18-pkg.tar.bz2 -C /
RUN rm -f /code-browser-2.18-pkg.tar.bz2
RUN cd /packages && \
  ./linkit code-browser-2.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

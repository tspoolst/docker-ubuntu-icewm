#name of container: workbench
#name of image: workbench-layer3
#versison of image: 0.1.0

#docker build -t workbench-layer3:0.1.0 .

FROM workbench-layer2:0.1.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

# add the Atom.io repo
RUN curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add - && \
  echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update && \
  apt-get install -y -q \
    nedit atom xterm rxvt-unicode \
    google-chrome-stable && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

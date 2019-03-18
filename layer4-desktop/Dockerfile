#name of container: workbench
#name of image: workbench-layer4
#versison of image: v0.4.0

#docker build -t workbench-layer4:v0.4.0 .

FROM tspoolst/docker-ubuntu-icewm:layer3-v0.4.0
#FROM workbench-layer3:v0.4.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

RUN apt-get update && \
  apt-get install -y -q \
    icewm icewm-themes \
    fbpanel \
    xrdp && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*

COPY packages-icewm.tar.bz2 /
RUN tar jxvf /packages-icewm.tar.bz2 -C /
RUN rm -f /packages-icewm.tar.bz2
RUN cd /packages && \
  ./linkit dlist-1.0.1 && \
  ./linkit iceicons-0.10.0 && \
  ./linkit icewm-themes-030820

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

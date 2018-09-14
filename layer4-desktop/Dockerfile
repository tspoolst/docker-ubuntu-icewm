#name of container: workbench
#name of image: workbench-layer4
#versison of image: 0.1.0

#docker build -t workbench-layer4:0.1.0 .

FROM workbench-layer3:0.1.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

RUN apt-get update
# && \
RUN apt-get install -y -q \
    icewm icewm-themes \
    rox-filer \
    fbpanel && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*

COPY desktop.tar.bz2 /
RUN tar jxvf /desktop.tar.bz2 -C /
RUN rm /desktop.tar.bz2
RUN cd /packages && \
  ./linkit shutils-0.0.0 && \
  ./linkit iceicons-0.10.0 && \
  ./linkit icewm-themes-030820 && \
  ./linkit dlist-1.0.1 && \
  ./linkit docker-code-browser-2.18 && \
  cp -av skel/{.[[:alnum:]]*,*} /root/ && \
  chown root.root /root -Rc

#RUN apt-file update

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

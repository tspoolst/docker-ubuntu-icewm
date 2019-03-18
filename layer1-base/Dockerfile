#name of container: workbench
#name of image: tspoolst/docker-ubuntu-icewm:workbench-layer1
#versison of image: v0.4.0

#docker build -t workbench-layer1:v0.4.0 .

FROM quantumobject/docker-baseimage:16.04
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

# Update the container
# Installation of nesesary package/software for this containers...
RUN apt-get update && \
  apt-get install -y -q \
    net-tools \
  && apt-get clean \
  && rm -rf /tmp/* /var/tmp/*  \
  && rm -rf /var/lib/apt/lists/*


#to add startup.sh to be runs the scripts during startup
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

#VOLUME /home

#expose port for https service
#EXPOSE 8008

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

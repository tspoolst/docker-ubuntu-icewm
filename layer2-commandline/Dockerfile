#name of container: workbench
#name of image: workbench-layer2
#versison of image: 0.1.0

#docker build -t workbench-layer2:0.1.0 .

FROM workbench-layer1:0.1.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

RUN apt-get update && \
  apt-get install -y -q \
    dialog apt-file man bzip2 zip unzip whois \
    bash-completion ncdu htop tree \
    vim mc lftp links lynx \
    iputils-ping openssh-client \
    nmap tcpdump iftop \
    docker.io \
    make gcc ruby && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*
RUN apt-file update
RUN wget -q https://releases.hashicorp.com/vagrant/2.1.5/vagrant_2.1.5_x86_64.deb && \
  dpkg -i vagrant_2.1.5_x86_64.deb && \
  rm -f vagrant_2.1.5_x86_64.deb && \
  vagrant plugin install pry-byebug
RUN ln -sv /projects/git /root/git

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

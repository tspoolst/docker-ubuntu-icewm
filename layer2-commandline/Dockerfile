#name of container: workbench
#name of image: workbench-layer2
#versison of image: v0.4.0

#docker build -t workbench-layer2:v0.4.0 .

FROM tspoolst/docker-ubuntu-icewm:layer1-v0.4.0
#FROM workbench-layer1:v0.4.0
MAINTAINER Trent Spoolsta  "tspoolst@gmail.com"

ENV TERM linux

RUN apt-get update && \
  apt-get install -y -q \
    sudo dialog apt-file man bzip2 zip unzip whois \
    bash-completion ncdu htop tree screen lsof \
    openssh-server \
    vim mc lftp links lynx \
    iputils-ping openssh-client \
    nmap tcpdump iftop jnettop \
    docker.io \
    make gcc \
    ruby ruby-dev python-pip jq \
    software-properties-common && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
#[of]:install ansible
RUN apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y -q \
    ansible && \
  apt-get clean && \
  rm -rf /tmp/* /var/tmp/* && \
  rm -rf /var/lib/apt/lists/*
#[cf]
#[of]:install vagrant 2.1.5
RUN wget -q https://releases.hashicorp.com/vagrant/2.1.5/vagrant_2.1.5_x86_64.deb && \
  dpkg -i vagrant_2.1.5_x86_64.deb && \
  rm -f vagrant_2.1.5_x86_64.deb && \
  vagrant plugin install vagrant-scp && \
  vagrant plugin install pry-byebug
#[cf]

RUN ln -sv /projects/git /root/git

COPY packages-commandline.tar.bz2 /
RUN tar jxvf /packages-commandline.tar.bz2 -C /
RUN rm -f /packages-commandline.tar.bz2
RUN cd /packages && \
  ./linkit shutils-0.0.0

COPY skel.tar.bz2 /
RUN tar jxvf /skel.tar.bz2 -C /
RUN rm -f /skel.tar.bz2
RUN cp -av /etc/skel/{.[[:alnum:]]*,*} /root/ && \
  chown root.root /root -Rc

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

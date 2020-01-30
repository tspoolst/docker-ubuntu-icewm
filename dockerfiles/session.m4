#[of]:install/setup container session
RUN chmod 4755 /usr/bin/mesg

COPY os/my_init/ /

RUN mkdir -p /etc/my_init.d
COPY os/startup.sh /etc/my_init.d/startup.sh
RUN chmod 755 /etc/my_init.d/startup.sh
RUN rm -fv /etc/configured

COPY os/add_user.bsh /add_user.bsh
RUN chmod 755 /add_user.bsh

# Use baseimage-docker's init system.
CMD ["/usr/sbin/my_init"]
#[cf]

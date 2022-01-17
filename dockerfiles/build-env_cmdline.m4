ifelse(DISTRO, `ubuntu', `define(`FROM',DOCKER_REPO`/build-env_ubuntu-16_base:'WORKBENCH_VERSION)dnl' ,`dnl')
ifelse(DISTRO, `centos', `define(`FROM',DOCKER_REPO`/build-env_centos-7_base:'WORKBENCH_VERSION)dnl' ,`dnl')
ifelse(DISTRO, `rhel', `define(`FROM',DOCKER_REPO`/build-env_rhel-7.6_base:'WORKBENCH_VERSION)dnl', `dnl')
include(`header.m4')dnl

include(`base_packages.m4')dnl
include(`docker_tools.m4')dnl
include(`git-2.23.0.m4')dnl
include(`bash-5.0.0.m4')dnl
include(`hashicorp.m4')dnl
include(`ansible-2.7.13.m4')dnl

# dnl define(`VBOX-REMOTE_VERSION',`0.1.1')
# dnl include(eval(`vbox-remote-'VBOX-REMOTE_VERSION`.m4'))dnl
include(`vbox-remote-0.2.2.m4')dnl

include(`shell-tools.m4')dnl
include(`rest.m4')dnl

COPY os/skel-cmdline/ /
RUN bash -c 'cp -av /etc/skel/{.[[:alnum:]]*,*} /root/ ; \
  chown root.root /root -Rc'

include(`session.m4')dnl

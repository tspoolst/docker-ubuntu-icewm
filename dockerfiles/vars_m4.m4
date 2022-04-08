define(`ifelse_or', `ifelse(eval(ifelse(`$1', `$2', `1', `0') || ifelse(`$1', `$3', `1', `0')), `1', `$4')')dnl
ifdef(`WORKBENCH_VERSION', , `define(`WORKBENCH_VERSION',`0.2.0')')dnl
ifdef(`WORKBENCH_MAJORVER', , `define(`WORKBENCH_MAJORVER',`0')')dnl
ifelse(DISTRO, `ubuntu',
  `define(`PACKAGE_CMD',`apt-get -y')dnl
define(`PACKAGE_UPDATE',PACKAGE_CMD `update')dnl
define(`PACKAGE_INSTALL',PACKAGE_CMD `install')dnl
define(`PACKAGE_CLEAN',PACKAGE_CMD `clean && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/*')dnl', `dnl')
ifelse_or(DISTRO, `centos', `rhel',
  `define(`PACKAGE_CMD',`yum -y')dnl
dnl define(`PACKAGE_UPDATE',PACKAGE_CMD `makecache')dnl
define(`PACKAGE_UPDATE',`:')dnl
define(`PACKAGE_INSTALL',PACKAGE_CMD `install')dnl
define(`PACKAGE_CLEAN',PACKAGE_CMD `clean all && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/yum/{repos,yumdb,history} /var/cache/yum/* && \
    if [[ -e /bin/mandb ]];then mandb;fi')dnl', `dnl')
dnl define(`PACKAGE_CLEAN',`:')dnl
define(`M4_LOCALCACHE',`host.docker.internal:8080/')dnl
dnl define(`M4_LOCALCACHE',`')dnl

#!/bin/bash

gl_localcacheActive="false"

if grep -q docker /proc/self/cgroup 2>/dev/null && \
  (timeout 1 bash -c "</dev/tcp/host.docker.internal/8080") &>/dev/null && \
  /bhttpget.bsh host.docker.internal:8080/repocache.txt /dev/null 2>/dev/null
then
  gl_localcacheActive="true"
fi

if [[ -d "/etc/apt" ]] ; then
  if ${gl_localcacheActive} ; then
    sed -e 's%\(http[s]*://\)\(host.docker.internal:8080/\)*%http://host.docker.internal:8080/%' -i /etc/apt/sources.list /etc/apt/sources.list.d/*
  else
    sed -e 's%\(http[s]*://\)\(host.docker.internal:8080/\)*%\1%' -i /etc/apt/sources.list /etc/apt/sources.list.d/*
  fi
elif [[ -d "/etc/yum.repos.d" ]] ; then
  if ${gl_localcacheActive} ; then
    sed -e 's%^mirrorlist%#mirrorlist%;s%^#baseurl%baseurl%;s%^metalink%#metalink%;s%\(http[s]*://\)\(host.docker.internal:8080/\)*%http://host.docker.internal:8080/%' -i /etc/yum.repos.d/*.repo
  else
    sed -e 's%\(http[s]*://\)\(host.docker.internal:8080/\)*%\1%' -i /etc/yum.repos.d/*.repo
  fi
fi

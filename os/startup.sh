#!/bin/bash

set -e

grep $(hostname) /etc/hosts || echo "127.0.0.1 $(hostname)" >> /etc/hosts

if [ -f /etc/configured ]; then
  echo 'already configured'
  #service ka-lite start
else
  #chown -R ka-lite:nogroup /var/ka-lite/.kalite
  #service ka-lite start
  #update-locale
  ##removing docker-clean allows bash-completion to work with apt-get package searches.
#[c]        rm -fv /etc/apt/apt.conf.d/docker-clean
#[c]        apt-get update
#[c]        [[ -e /usr/bin/apt-file ]] && apt-file update
  date > /etc/configured
fi

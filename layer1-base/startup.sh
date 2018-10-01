#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
        #service ka-lite start
else
        #chown -R ka-lite:nogroup /var/ka-lite/.kalite
        #service ka-lite start
        update-locale
        ##removing docker-clean allows bash-completion to work with apt-get package searches.
        rm -fv /etc/apt/apt.conf.d/docker-clean
        apt-get update
        [[ -e /usr/bin/apt-file ]] && apt-file update
        date > /etc/configured
fi

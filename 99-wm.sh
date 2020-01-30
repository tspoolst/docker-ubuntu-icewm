#!/usr/bin/env bash

$(set | grep ^DOCKER | (while read i;do echo "export ${i}";done))

export PATH=/usr/local/bin:\$PATH

#IP=$(ifconfig en0 | grep "inet " | awk '$1=="inet" {print $2}')
#${IP}
{
  xhost + localhost
  #xhost local:
  #echo $(ifconfig en0 | grep "inet " | awk '$1=="inet" {print $2}')
  id
  #sleep 5
  #exec xterm
  #echo waiting
  #while [[ -e ${HOME}/init.lock ]] ; do sleep 1;done
  echo starting
  #echo rox
  #docker exec -d workbench rox -l=leftbar -p=desktop0
  #echo fbpanel
  #docker exec -d workbench fbpanel
  #echo icewm
  docker exec ${gl_containerName} sudo -i -u ${USER_UNAME} ./icewm.xinitrc
  echo stopping
  #set -xv
  killall Xquartz
  echo stopped
} > ~/xstart.log 2>&1

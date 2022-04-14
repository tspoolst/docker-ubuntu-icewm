function wb {
  set -xv
  typeset lc_containerName
  if [[ "$1" == "-n" ]] ; then
    shift
    if [[ -z "$1" ]] ; then
      echo "-n switch missing container name" >&2
      return 1
    fi
    lc_containerName="$1"
    shift
  fi
  lc_containerName="${lc_containerName:-workbench}"
  if ! docker ps -a | tail -n +2 | grep -q " ${lc_containerName}$" ; then
    mkdir -p ${HOME}/.vagrant.d/boxes ${HOME}/.vagrant.d/tmp ${HOME}/.terraform
    gl_imageName=tspoolst/build-env_ubuntu-16.04_cmdline:1.1.0
    docker run \
      -v ${HOME}:${HOME}/hosthome \
      -v ${HOME}/git:${HOME}/git \
      -v ${HOME}/.ssh:${HOME}/.ssh \
      -v ${HOME}/.awx:${HOME}/.awx \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e VBOXHOST=host.docker.internal \
      $(if [[ $(uname -s) == "Linux" ]] ; then
        if ! host_ip=$(dig +short host.docker.internal | grep .) ; then
          host_ip=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
        fi
        echo "--add-host host.docker.internal:${host_ip} -e VBOXHOST_IP=${host_ip}"
      fi) \
      -d \
      --restart always \
      --net host \
      --name ${lc_containerName} \
      -l ${lc_containerName} \
      -h ${lc_containerName} \
      --privileged \
      ${gl_imageName} >&2
    docker exec -ti ${lc_containerName} /add_user.bsh "$(id -u)" "$(id -g)" "$(id -un)" "$(id -gn)" "${HOME}" >&2
  fi
  if [[ -n "$1" ]] ; then
    docker exec -ti ${lc_containerName} sudo -i -u $(id -un) bash -c "$@"
  else
    docker exec -ti ${lc_containerName} sudo -i -u $(id -un)
  fi
  set +xv
}
function wbg {
  set -xv
  typeset lc_containerName
  if [[ "$1" == "-n" ]] ; then
    shift
    if [[ -z "$1" ]] ; then
      echo "-n switch missing container name" >&2
      return 1
    fi
    lc_containerName="$1"
    shift
  fi
  lc_containerName="${lc_containerName:-workbench}"
  if ! docker ps -a | tail -n +2 | grep -q " ${lc_containerName}$" ; then
    mkdir -p ${HOME}/.vagrant.d/boxes ${HOME}/.vagrant.d/tmp ${HOME}/.terraform
    gl_imageName=tspoolst/build-env_ubuntu-20.04_desktop:1.1.0
    docker run \
      -v ${HOME}:${HOME}/hosthome \
      -v ${HOME}/git:${HOME}/git \
      -v ${HOME}/.ssh:${HOME}/.ssh \
      -v ${HOME}/.awx:${HOME}/.awx \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -e VBOXHOST=host.docker.internal \
      $(if [[ $(uname -s) == "Linux" ]] ; then
        if ! host_ip=$(dig +short host.docker.internal | grep .) ; then
          host_ip=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')
        fi
        echo "--add-host host.docker.internal:${host_ip} -e VBOXHOST_IP=${host_ip}"
      fi) \
      -p 5901:5901 \
      -d \
      --restart always \
      --net host \
      --name ${lc_containerName} \
      -l ${lc_containerName} \
      -h ${lc_containerName} \
      --privileged \
      ${gl_imageName} >&2
    docker exec -ti ${lc_containerName} /add_user.bsh "$(id -u)" "$(id -g)" "$(id -un)" "$(id -gn)" "${HOME}" >&2
  fi
  if [[ -n "$1" ]] ; then
    docker exec -ti ${lc_containerName} sudo -i -u $(id -un) bash -c "$@"
  else
    docker exec -ti ${lc_containerName} sudo -i -u $(id -un)
  fi
  set +xv
}
function wbd {
  typeset lc_containerName
  if [[ "$1" == "-n" ]] ; then
    shift
    if [[ -z "$1" ]] ; then
      echo "-n switch missing container name" >&2
      return 1
    fi
    lc_containerName="$1"
    shift
  fi
  lc_containerName="${lc_containerName:-workbench}"
  docker ps -a | tail -n +2 | grep -q " ${lc_containerName}$" && {
    echo "stopping and removing ${lc_containerName}"
    docker stop ${lc_containerName} &>/dev/null
    docker rm ${lc_containerName} &>/dev/null
  }
}

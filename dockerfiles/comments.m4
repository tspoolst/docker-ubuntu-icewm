#name of container: workbench
`#'name of image: DOCKER_REPO/docker-ubuntu-icewm:layer2-v`'WORKBENCH_VERSION
`#'version of image: v`'WORKBENCH_VERSION

`#'docker build -t DOCKER_REPO/docker-ubuntu-icewm:layer2-v`'WORKBENCH_VERSION .
#./run.bsh

`#'docker save DOCKER_REPO/docker-ubuntu-icewm:layer2-v | gzip -9c > DOCKER_REPO/docker-ubuntu-icewm-layer2-v`'WORKBENCH_VERSION.dimg.gz

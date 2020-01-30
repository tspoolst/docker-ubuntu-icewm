#[of]:install rest tools
RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/tspoolst/json2yaml-yaml2json/archive/v0.1.0.tar.gz && \
  tar zxf /tmp/v0.1.0.tar.gz -C / && \
  cp -av json2yaml-yaml2json-0.1.0/json2yaml json2yaml-yaml2json-0.1.0/yaml2json /usr/bin/ && \
  rm -rf /tmp/*
#[cf]

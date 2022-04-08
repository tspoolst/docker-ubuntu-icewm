#[of]:install terraform-0.12.7 and go-1.12.9
#disable terraform upgrade check
ENV CHECKPOINT_DISABLE=yes

RUN ${WGET} http://`'M4_LOCALCACHE`'dl.google.com/go/go1.12.9.linux-amd64.tar.gz && \
  tar zxf /tmp/go1.12.9.linux-amd64.tar.gz -C /usr/local && \
  rm -rf /tmp/*
RUN ${WGET} http://`'M4_LOCALCACHE`'releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip && \
  unzip /tmp/terraform_0.12.7_linux_amd64.zip -d /usr/bin/ && \
  rm -rf /tmp/*
RUN echo "complete -C /usr/bin/terraform terraform" > /usr/share/bash-completion/completions/terraform


RUN mkdir -p /terraform-plugins/linux_amd64/

#COPY terraform-plugins/linux_amd64/terraform-provider-null_v2.1.2_x4 /terraform-plugins/linux_amd64/
RUN ${WGET} http://`'M4_LOCALCACHE`'releases.hashicorp.com/terraform-provider-null/2.1.2/terraform-provider-null_2.1.2_linux_amd64.zip && \
  unzip /tmp/terraform-provider-null_2.1.2_linux_amd64.zip -d /terraform-plugins/linux_amd64/ && \
  chmod 755 /terraform-plugins/linux_amd64/terraform-provider-null_* && \
  rm -rf /tmp/*

#COPY terraform-plugins/linux_amd64/terraform-provider-virtualbox /terraform-plugins/linux_amd64/
RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/terra-farm/terraform-provider-virtualbox/releases/download/v0.2.0/terraform-provider-virtualbox-v0.2.0-linux_amd64 && \
  mv /tmp/terraform-provider-virtualbox-v0.2.0-linux_amd64 /terraform-plugins/linux_amd64/terraform-provider-virtualbox_v0.2.0 && \
  chmod 755 /terraform-plugins/linux_amd64/terraform-provider-virtualbox_*

RUN ${WGET} http://`'M4_LOCALCACHE`'github.com/radekg/terraform-provisioner-ansible/releases/download/v2.3.0/terraform-provisioner-ansible-linux-amd64_v2.3.0 && \
  mv /tmp/terraform-provisioner-ansible-linux-amd64_v2.3.0 /terraform-plugins/linux_amd64/terraform-provisioner-ansible_v2.3.0 && \
  chmod 755 /terraform-plugins/linux_amd64/terraform-provisioner-ansible_*
#COPY terraform-plugins/linux_amd64/terraform-provisioner-ansible_v2.3.0 /terraform-plugins/linux_amd64/

#[c]RUN chmod 755 /terraform-plugins/linux_amd64/* && \
#[c]  rm -rf /tmp/*
#[cf]

FROM openshift/jenkins-agent-nodejs-8-centos7:v3.11

USER root

ENV APP_ROOT=/opt/app-root
COPY bin/ ${APP_ROOT}/bin/
RUN yum -y install qemu-kvm git wget \
                   ansible unzip python-requests && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    ${APP_ROOT}/bin/download_packer.sh && \
    mkdir -p /build && \
    chown -R 1001:0 /build && \
    chgrp -R 0 /build && \
    chmod -R g=u /build && \
    usermod -a -G kvm default



USER 1001

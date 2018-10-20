FROM openshift/jenkins-agent-nodejs-8-centos7:v3.11

USER root

RUN yum -y install qemu-kvm git wget \
                   ansible unzip python-requests && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV APP_ROOT=/opt/app-root
COPY bin/ ${APP_ROOT}/bin/
RUN ${APP_ROOT}/bin/download_packer.sh && \
    chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001

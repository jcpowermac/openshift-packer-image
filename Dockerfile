FROM openshift/jenkins-slave-base-centos7

RUN yum -y install qemu-kvm git wget \
                   ansible unzip python-requests && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV APP_ROOT=/opt/app-root
#ENV HOME=${APP_ROOT}
ENV UID=1001

ENV PATH=${APP_ROOT}/bin:${PATH}
COPY bin/ ${APP_ROOT}/bin/

RUN chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
    ${APP_ROOT}/bin/download_packer.sh

USER ${UID}
#WORKDIR ${APP_ROOT}

#ENTRYPOINT [ "uid_entrypoint"]
#CMD run
EXPOSE 5900

FROM jenkins/jenkins:lts-slim@sha256:45556c35eec2e459cd6644c4d3925a0460e0b2b9d82a8bbfdf2452dbfba5d167

USER root

RUN mkdir -p /var/jenkins/boot

COPY plugins.txt /var/jenkins/boot/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /var/jenkins/boot/plugins.txt
COPY boot-sequence.sh /var/jenkins/boot/boot-sequence.sh

ENTRYPOINT "/sbin/tini" "-s" "--" "/var/jenkins/boot/boot-sequence.sh"

FROM jenkins/jenkins:lts-slim

USER root

RUN mkdir -p /var/jenkins/boot

COPY plugins.txt /var/jenkins/boot/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /var/jenkins/boot/plugins.txt
COPY boot-sequence.sh /var/jenkins/boot/boot-sequence.sh

ENTRYPOINT "/sbin/tini" "-s" "--" "/var/jenkins/boot/boot-sequence.sh"

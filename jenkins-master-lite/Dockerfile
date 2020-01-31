FROM jenkins/jenkins:lts-slim@sha256:ffcca5d33e315beb9832f519fd21c539af020964e81678b0e6a6a8a5ec8f3b35

USER root

RUN mkdir -p /var/jenkins/boot

COPY plugins.txt /var/jenkins/boot/plugins.txt
COPY boot-sequence.sh /var/jenkins/boot/boot-sequence.sh

ENTRYPOINT "/sbin/tini" "-s" "--" "/var/jenkins/boot/boot-sequence.sh"

# using a self-reference instead of upstream Jenkins
# because apparently they released two versions
# using the 2.222.1 tag
#
# Keeping it until I upgrade to the latest-lts
#
# Note to future me: DO NOT REMOVE THE SHA256!
#   You spent an entire afternoon trying to debug
#   what caused the issue.
FROM andrebq/jenkins-gce-master-lite:0.0.16@sha256:e6241fa06a971b61d63ab551a7ba0f56fc09910de94b7f6d66b818ecb1fdf36d

USER root

RUN mkdir -p /var/jenkins/boot

COPY plugins.txt /var/jenkins/boot/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /var/jenkins/boot/plugins.txt
COPY boot-sequence.sh /var/jenkins/boot/boot-sequence.sh

ENTRYPOINT "/sbin/tini" "-s" "--" "/var/jenkins/boot/boot-sequence.sh"

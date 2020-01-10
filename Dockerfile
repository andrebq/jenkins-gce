FROM odavid/my-bloody-jenkins:2.150.3-109@sha256:c7b1cdaed5aac8ed511fb6eb85cb563725e289188bf11bb07a0fdf299b392b3f

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

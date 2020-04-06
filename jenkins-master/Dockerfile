FROM odavid/my-bloody-jenkins:2.204.2-182-jdk11

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

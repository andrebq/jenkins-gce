FROM odavid/my-bloody-jenkins:2.204.1-jdk11@sha256:07da42debd0bf03b22d01c1b7f2dd69019d4689e027c56a4dccf745071f54f8d

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

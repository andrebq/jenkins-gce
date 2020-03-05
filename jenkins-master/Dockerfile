FROM odavid/my-bloody-jenkins:2.204.2-182-jdk11@sha256:4a3ae9d4511f01c3bbc481a7bd86a466582228625e80abf44d8c34137c7f2698

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

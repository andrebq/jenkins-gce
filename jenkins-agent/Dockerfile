FROM odavid/jenkins-jnlp-slave:3.40-1-21-jdk11@sha256:cfebdf4fe04d2f9fed54eddb4af57623d676a5a80e4be8579641cedfc6340f19

RUN mkdir -p /tools && \
    cd /tools && \
    wget --quiet -O google-cloud-sdk-275.0.0-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-275.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-275.0.0-linux-x86_64.tar.gz

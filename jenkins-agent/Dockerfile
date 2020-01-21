FROM odavid/jenkins-jnlp-slave:3.36-1-20-debian@sha256:fcb6c2809e779234fe6f23420585ec9b8a8b0d78e7d408ede57241336cbdc599

RUN mkdir -p /tools && \
    cd /tools && \
    wget --quiet -O google-cloud-sdk-275.0.0-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-275.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-275.0.0-linux-x86_64.tar.gz

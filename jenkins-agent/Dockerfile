FROM andrebq/go-getter:v0.0.2@sha256:f2d1cb862907c1e23627215613fe6dfa47fa8fb797c1e99b8c87fc1fc1b9bf24 as goget

# Download toolset
FROM alpine:latest@sha256:ddba4d27a7ffc3f86dd6c2f92041af252a1f23a8e742c90e6e1297bfa1bc0c45 as toolbox

COPY --from=goget /go-getter /tools/go-getter
RUN /tools/go-getter -mode file \
    'https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl?archive=false&checksum=sha256:99ade995156c1f2fcb01c587fd91be7aae9009c4a986f43438e007265ca112e8' \
    /tools/kubectl && \
    chmod 0755 /tools/kubectl

RUN /tools/go-getter -mode file \
    'https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip?archive=false&checksum=sha256:fcc719314660adc66cbd688918d13baa1095301e2e507f9ac92c9e22acf4cc02' \
    /tools/terraform_0.12.16_linux_amd64.zip && \
    cd /tools && \
    unzip terraform_0.12.16_linux_amd64.zip && \
    rm terraform_0.12.16_linux_amd64.zip

RUN /tools/go-getter -mode file \
    'https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz?archive=false&checksum=sha256:38614a665859c0f01c9c1d84fa9a5027364f936814d1e47839b05327e400bf55' \
    /tools/helm-v2.14.3-linux-amd64.tar.gz && \
    cd /tools && \
    tar -xf helm-v2.14.3-linux-amd64.tar.gz && \
    rm helm-v2.14.3-linux-amd64.tar.gz && \
    mv linux-amd64/* . && \
    rm -r linux-amd64

RUN /tools/go-getter -mode file \
    'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-275.0.0-linux-x86_64.tar.gz?archive=false&checksum=sha256:2e4527b1870b06bf835013a551f6ff61ce105546184e8b08ee3b14e93feedcaa' \
    /tools/google-cloud-sdk-275.0.0-linux-x86_64.tar.gz && \
    cd /tools && \
    tar -xf google-cloud-sdk-275.0.0-linux-x86_64.tar.gz && \
    rm /tools/google-cloud-sdk-275.0.0-linux-x86_64.tar.gz

RUN /tools/go-getter -mode file \
    'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u242-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz?archive=false&checksum=sha256:f39b523c724d0e0047d238eb2bb17a9565a60574cf651206c867ee5fc000ab43' \
    /tools/jdk8/OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz && \
    cd /tools/jdk8 && \
    tar -xf OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz && \
    rm /tools/jdk8/OpenJDK8U-jdk_x64_linux_hotspot_8u242b08.tar.gz

### Target Stage

FROM odavid/jenkins-jnlp-slave:3.36-1-20-jdk11@sha256:b49c6d154d3126f9e6096b144d1af8673e9441b8b4351b8abd8da08a3ba865df

COPY --from=toolbox /tools /tool
RUN chown -R jenkins:jenkins /tool/google-cloud-sdk

RUN su jenkins -c 'bash /tool/google-cloud-sdk/install.sh --quiet'

ENV JAVA8_HOME=/tool/jdk8/jdk8u242-b08

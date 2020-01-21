#!/usr/bin/env bash
set -euo pipefail

declare tagname
tagname=$(git tag -l --points-at HEAD | head -n 1)
readonly tagname

function pushMaster {
    declare imageName
    imageName=andrebq/jenkins-gce-master:"${tagname}"
    docker push andrebq/jenkins-gce-master "${imageName}"

    imageName=andrebq/jenkins-gce-master-lite:"${tagname}"
    docker push andrebq/jenkins-gce-master-lite "${imageName}"
}

function pushAgent {
    declare imageName
    imageName=andrebq/jenkins-gce-agent:"${tagname}"
    docker push andrebq/jenkins-gce-agent "${imageName}"

    imageName=andrebq/jenkins-gce-agent-lite:"${tagname}"
    docker push andrebq/jenkins-gce-agent-lite "${imageName}"
}

pushMaster && pushAgent

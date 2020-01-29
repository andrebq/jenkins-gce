#!/usr/bin/env bash
set -euo pipefail

declare tagname
tagname=$(git tag -l --points-at HEAD | head -n 1)
readonly tagname

function pushMaster {
    declare imageName
    imageName=andrebq/jenkins-gce-master:"${tagname}"
    docker push "${imageName}"

    imageName=andrebq/jenkins-gce-master-lite:"${tagname}"
    docker push "${imageName}"
}

function pushAgent {
    declare imageName
    imageName=andrebq/jenkins-gce-agent:"${tagname}"
    docker push "${imageName}"

    imageName=andrebq/jenkins-gce-agent-lite:"${tagname}"
    docker push "${imageName}"
}

pushMaster && pushAgent

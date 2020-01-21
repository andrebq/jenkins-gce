#!/usr/bin/env bash
set -euo pipefail

declare tagname
tagname=$(git tag -l --points-at HEAD | head -n 1)
readonly tagname

function tagMaster {
    declare imageName
    imageName=andrebq/jenkins-gce-master:"${tagname}"
    docker tag andrebq/jenkins-gce-master "${imageName}"

    imageName=andrebq/jenkins-gce-master-lite:"${tagname}"
    docker tag andrebq/jenkins-gce-master-lite "${imageName}"
}

function tagAgent {
    declare imageName
    imageName=andrebq/jenkins-gce-agent:"${tagname}"
    docker tag andrebq/jenkins-gce-agent "${imageName}"

    imageName=andrebq/jenkins-gce-agent-lite:"${tagname}"
    docker tag andrebq/jenkins-gce-agent-lite "${imageName}"
}

tagMaster && tagAgent

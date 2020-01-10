#!/usr/bin/env bash
set -euo pipefail

declare tagname
tagname=$(git tag -l --points-at HEAD | head -n 1)
readonly tagname

imageName=andrebq/jenkins-gce:"${tagname}"


docker build -t "${imageName}" .
docker push "${imageName}"

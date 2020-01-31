#!/usr/bin/env bash
set -euo pipefail

function build {
    declare buildType="${1}"
    declare -r folder="jenkins-${buildType}"
    pushd "${folder}"
    docker build -t andrebq/jenkins-gce-"${buildType}" .
    popd
}

readonly operation=${1}
case "${operation}" in
    master)
        build "${operation}"
        build "${operation}-lite"
        ;;
    agent)
        build "${operation}"
        build "${operation}-lite"
        ;;
    *)
        echo "Invalid build type ${operation}"
        exit 1
    ;;
esac

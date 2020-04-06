#!/usr/bin/env bash
set -euo pipefail

function upgradePlugins {
    declare -r folder="${1}"
    pushd "${folder}"
    python3 ../build-tools/upgrade-plugins.py
    popd
}

upgradePlugins "jenkins-master"
upgradePlugins "jenkins-master-lite"

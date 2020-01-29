#!/usr/bin/env bash
set -euo pipefail

function fmt-plugins-txt {
    declare -r plugins_file="${1}"
    sort < "${plugins_file}" | uniq | tee "${plugins_file}.sorted" > /dev/null
    mv "${plugins_file}.sorted" "${plugins_file}"
}

fmt-plugins-txt ./jenkins-master-lite/plugins.txt
fmt-plugins-txt ./jenkins-master/plugins.txt

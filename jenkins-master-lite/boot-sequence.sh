#!/usr/bin/env bash
set -euo pipefail

function setup-jenkins-home-permissions {
    if [[ ! -d "${JENKINS_HOME}" ]]; then
        echo "${JENKINS_HOME} is not a directory" >&2
        exit 1
    fi
    chown jenkins "${JENKINS_HOME}"
}

function install-selected-plugins {
    su -c 'bash /usr/local/bin/install-plugins.sh < /var/jenkins/boot/plugins.txt'
}

function install-user-plugins {
    declare -r userPluginsPath="/var/jenkins/user-boot/plugins.txt"
    if [[ ! -f "${userPluginsPath}" ]]; then
        echo "File ${userPluginsPath} does not exists. No custom plugins"
        return 0
    fi
    su -c "bash /usr/local/bin/install-plugins.sh < ${userPluginsPath}"
}

function start-jenkins {
    su -c 'bash /usr/local/bin/jenkins.sh'
}

setup-jenkins-home-permissions
install-selected-plugins
install-user-plugins
start-jenkins

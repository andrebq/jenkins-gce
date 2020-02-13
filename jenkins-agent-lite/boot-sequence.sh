#!/bin/bash
set -e -o pipefail

if [ -z "${CALL_HOME}" -a ! -z "${JENKINS_URL}" ]; then
    CALL_HOME="${JENKINS_URL}/tcpSlaveAgentListener/"
fi

# Check if we can get a valid response from our home.
#
# A valid response is anything that returns 2xx status
#
# Globals:
#   None
# Arguments:
#   homeUrl: contains the url used to execute a http get request
# Returns:
#   1 if an error happened / 0 if everything is OK.
function call-home {
    declare -r homeUrl="${1}"
    curl -q -fsSLk "${homeUrl}" || { echo "Unable to call home ${homeUrl}" >&2; return 1; }
    return 0
}

# Try to _call-home_ up to N times with a fixed delay between calls
#
# Globals:
#   None
# Arguments:
#   homeUrl: contains the url used to execute a http get request
#   loopCount: how many attempts before indicating a failure
#   delay: how many seconds to sleep between each attempt
# Returns:
#   1 if an error happened / 0 if everything is OK.
function try-call-home {
    declare -r homeUrl="${1}"
    declare -r loopCount="${2:-6}"
    declare -r delay="${3:-10}"
    declare count=0

    declare loopAgain=1
    while [ "${loopAgain}" == "1" ] ; do
        if call-home "${homeUrl}"; then
            loopAgain=0
        else
            count=$(($count+1))
            case "${count}" in
                "${loopCount}")
                    loopAgain=0
                    ;;
                *)
                    sleep "${delay}"
                    ;;
            esac
        fi
    done
}

if ! try-call-home "${CALL_HOME}" "${CALL_HOME_ATTEMPTS}" "${CALL_HOME_DELAY}"; then
    echo "Unable to call home after many attempts. Do we have connection to external resources" >&2
fi

source "$(which jenkins-slave)"

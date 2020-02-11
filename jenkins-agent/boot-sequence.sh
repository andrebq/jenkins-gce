#!/bin/bash
set -e -o pipefail

function call-home {
    curl -q -fsSLk "${CALL_HOME}" || { echo "Unable to call home ${CALL_HOME}" >&2; return 1; }
    return 0
}

function try-call-home {
    declare count=0
    while ! call-home; do
        count=$(($count+1))
        case "${count}" in
            6)
                return 1
                ;;
            *)
                sleep 10
                ;;
        esac
    done
}

if [ ! -z "${CALL_HOME}" ]; then
    if ! try-call-home; then
        echo "Unable to call home after many attempts. Do we have connection to external resources" >&2
    fi
fi

source "/entrypoint.sh"

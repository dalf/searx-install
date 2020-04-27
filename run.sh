#!/bin/sh
VAGRANT=$(which vagrant)

if [ -z ${VAGRANT} ]; then
    echo "vagrant not found"
    exit 1
fi

set -e

# create a patch (applied later in /shared/test/setup.sh )
cd searx
git diff > ../shared/searx.patch
cd ..

# destroy existing
${VAGRANT} destroy -f

# start
${VAGRANT} up --parallel

# system upgrade
${VAGRANT} ssh -c 'sudo /shared/test/presetup.sh'

# restart to apply all modifications
${VAGRANT} reload

# install searx
${VAGRANT} ssh -c 'sudo /shared/test/setup.sh'

# restart : make sure reboot is not a problem
${VAGRANT} reload

# check
${VAGRANT} ssh -c 'sudo /shared/test/check.sh'

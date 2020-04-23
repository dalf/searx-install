#!/bin/sh
set -e

cd searx
git diff > ../shared/searx.patch
vagrant destroy
vagrant up
vagrant ssh -c 'sudo /shared/test/presetup.sh'
vagrant reload
vagrant ssh -c 'sudo /shared/test/setup.sh'
vagrant reload
vagrant ssh -c 'sudo /shared/test/check.sh'

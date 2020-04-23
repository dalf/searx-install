git config --global user.email johndoe@nowhere.com
git config --global user.name johndoe

mkdir -p /srv/
cd /srv

git clone https://github.com/return42/searx/
cd searx
git checkout filtron
git apply /shared/searx.patch
sed -i 's/export GIT_BRANCH=master/export GIT_BRANCH=filtron/g' Makefile
make buildenv

chown -R vagrant:vagrant /share/searx

export FORCE_TIMEOUT=0
./utils/searx.sh install all
./utils/filtron.sh install all
./utils/morty.sh install all

./utils/filtron.sh nginx install
./utils/morty.sh nginx install
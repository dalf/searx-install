=============
searx-install
=============

Automatic testing of https://github.com/asciimoo/searx/pull/1803::

  git clone https://github.com/dalf/searx-install.git searx-install

  cd searx-install
  git submodule init
  git submodule update

To update submodule branch filtron https://github.com/return42/searx.git ::

  cd searx
  git checkout filtron
  git pull origin filtron

To get started, first install vagrant_ and if you do not have any other
preference install VirtualBox (see providers_).  To test just simply run the
shell script::

  ./run.sh
  ..

To run interactive tests in the VM use ssh and change dir to the searx clone in
the VM::

  $ vagrant ssh
  ..
  vagrant@vagrant:~$ cd /srv/searx
  # E.g. to debug the searx instance running on the VM
  vagrant@vagrant:/srv/searx$ sudo -H ./utils/searx.sh inspect service


.. _vagrant: https://github.com/asciimoo/searx/pull/1803#issuecomment-617157036
.. _providers: https://www.vagrantup.com/docs/providers/

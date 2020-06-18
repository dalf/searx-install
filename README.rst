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
preference install VirtualBox (see providers_).  Don't forget to add your user
to provider's group, otherwise you will not have access to the *host-only*
network and other resources.  If you are using VirtualBox use the line below.
To get active you need to logout of your (desktop) session and login again::

  sudo usermod -a -G vboxusers "$USER"

There is a bug with the *host-only* network in vagrant (see issue-3083_).  If
you are using VirtualBox, the simplest workaround is to remove the ``vboxnet0``
adapter which was inital created by VirtualBox (vagrant will create it's own)::

  $ VBoxManage list dhcpservers
  NetworkName:    HostInterfaceNetworking-vboxnet0
  Dhcpd IP:       192.168.56.100
  ...

  $ VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0
  ...

To test just simply run the shell script::

  ./run.sh
  ..

To run interactive tests in the VM use ssh and change dir to the searx clone in
the VM::

  $ vagrant ssh
  ..
  vagrant@vagrant:~$ cd /srv/searx
  # E.g. to debug the searx instance running on the VM
  vagrant@vagrant:/srv/searx$ sudo -H ./utils/searx.sh inspect service


.. _issue-3083: https://github.com/hashicorp/vagrant/issues/3083
.. _vagrant: https://github.com/asciimoo/searx/pull/1803#issuecomment-617157036
.. _providers: https://www.vagrantup.com/docs/providers/

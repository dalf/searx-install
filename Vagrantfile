# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.synced_folder "shared/", "/shared"
  config.vm.provider "virtualbox" do |vb|
    # VM name
    vb.name = "searx-bionic64-nginx"
    
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
end

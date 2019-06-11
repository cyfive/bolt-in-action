# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "centos/7"

  config.vm.define "node_01" do |node_01|
    node_01.vm.box = "centos/7"
    node_01.vm.hostname = "node-01"
    node_01.vm.network "private_network", ip: "192.168.254.10"
    node_01.vm.provision "shell", path: "add-bolt-user.sh"
  end

  config.vm.define "node_02" do |node_02|
    node_02.vm.box = "centos/7"
    node_02.vm.hostname = "node-02"
    node_02.vm.network "private_network", ip: "192.168.254.11"
    node_02.vm.provision "shell", path: "add-bolt-user.sh"
  end

  config.vm.define "node_03" do |node_03|
    node_03.vm.box = "centos/7"
    node_03.vm.hostname = "node-03"
    node_03.vm.network "private_network", ip: "192.168.254.12"
    node_03.vm.provision "shell", path: "add-bolt-user.sh"
  end

  config.vm.define "bolt_node" do |bolt_node|
    bolt_node.vm.box = "centos/7"
    bolt_node.vm.hostname = "bolt-node"
    bolt_node.vm.network "private_network", ip: "192.168.254.13"
    bolt_node.vm.provision "shell", inline: <<-SHELL
       sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
       sudo yum install -y pdk puppet-bolt
       echo 'export PATH=/opt/puppetlabs/*/bin:$PATH' >> /home/vagrant/.bashrc
       cp /vagrant/keys/* /home/vagrant/.ssh/
       sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa*
       sudo chmod 600 /home/vagrant/.ssh/id_rsa*
    SHELL
  end


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

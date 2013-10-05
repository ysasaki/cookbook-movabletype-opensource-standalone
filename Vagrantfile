# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant.configure("2") do |config|
  config.vm.hostname = "mtos-berkshelf"
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 512]
  end

  config.berkshelf.berksfile_path = "./Berksfile"
  # To keep site-cookbooks
  config.berkshelf.enabled = false

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./site-cookbooks", "./cookbooks"]
    chef.roles_path = "./roles"
    chef.add_role "mtos-standalone"
  end
end

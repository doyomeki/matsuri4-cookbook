# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.username = "vagrant"
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.vm.boot_timeout = 120
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.username = "vagrant"
    override.ssh.private_key_path = "~/.ssh/id_rsa"
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.ssh.pty       = true

    provider.token = ENV["DIGITALOCEAN_TOKEN"]
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'nyc3'
    provider.size = '512mb'
    provider.ssh_key_name = "wercker_for_matsuri4"

    override.omnibus.chef_version = "11.16.0"
    override.vm.provision "chef_solo" do |chef|
      chef.custom_config_path = "Vagrantfile.chef"
      chef.cookbooks_path = ["cookbooks"]
      chef.roles_path = "./roles"
      chef.data_bags_path = "./data_bags"
      chef.node_name = "webapp"
      chef.run_list  = %w[
        role[base]
        role[web]
      ]
    end
  end
end

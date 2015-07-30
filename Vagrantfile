# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu14.04-x86"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
	config.vm.network "forwarded_port", guest: 8080, host: 8686 #Jenkins
  config.vm.network "forwarded_port", guest: 80, host: 8787 #Gitlab
  
  config.vm.provider :virtualbox do |vb|
	  vb.name = "Taller Integracion Continua"
    vb.customize ["modifyvm", :id, "--memory", "768"]
  end

  config.vm.provision :puppet do |puppet|
	  puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
		puppet.module_path = ['dist','spec/fixtures/modules' ]
    puppet.options = "--verbose --debug"
  end
end

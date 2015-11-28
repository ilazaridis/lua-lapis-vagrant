# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
cd lapis
lapis server &>/dev/null &
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "init.sh"
  config.vm.provision :shell, inline: $script, run: "always"
  config.vm.synced_folder "lapis/", "/home/vagrant/lapis", create: true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.network "forwarded_port", guest: 8080, host: 9090
end

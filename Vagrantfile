Vagrant.configure("2") do |config|
  config.vm.box = "rubicon/ubuntu1404-salt"

  #Config to update vmware tools on kernal upgrade
  # config.vm.provision "shell", inline: $fix_vmware_tools_script

  ## This connects local salt configuration to Vagrant for salt to use
  config.vm.synced_folder "srv/", "/srv/"
  config.vm.synced_folder "/web/nodeApps/", "/web/nodeApps/"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provision :salt do |salt|
    salt.bootstrap_options = '-F -c /tmp'
    salt.minion_config = 'srv/minion'
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = 'info'
  end
end
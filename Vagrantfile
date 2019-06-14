Vagrant.configure("2") do |config|

#  config.vm.box = "ubuntu/trusty64"
  config.vm.box = "xenial64_pshah"
  config.vm.hostname = "DevOpsAs6"
  config.vm.network "private_network" , ip: "192.168.33.70"
  config.vm.provision "shell", path: "provision.sh"
  # config.vm.network "forwarded_port", guest: 80 , host: 8045 
  # config.vm.network "forwarded_port", guest: 5901 , host: 5901


  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end


end

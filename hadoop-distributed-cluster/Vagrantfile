Vagrant::Config.run do |config|

  config.vm.box = "ubuntu-precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
  end

  config.vm.define :master do |master|
    master.vm.network :hostonly, "192.168.1.10"
    master.vm.host_name = "master"
  end

  config.vm.define :backup do |backup|
    backup.vm.network :hostonly, "192.168.1.11"
    backup.vm.host_name = "backup"
  end

  config.vm.define :hadoop1 do |hadoop1|
    hadoop1.vm.network :hostonly, "192.168.1.12"
    hadoop1.vm.host_name = "hadoop1"
  end

  config.vm.define :hadoop2 do |hadoop2|
    hadoop2.vm.network :hostonly, "192.168.1.13"
    hadoop2.vm.host_name = "hadoop2"
  end

  config.vm.define :hadoop3 do |hadoop3|
    hadoop3.vm.network :hostonly, "192.168.1.14"
    hadoop3.vm.host_name = "hadoop3"
  end
end

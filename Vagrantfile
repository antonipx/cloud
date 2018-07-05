Vagrant.configure("2") do |config|

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/home/vagrant/sync', disabled: true
  config.vm.synced_folder '.', '/vagrant', type: 'rsync'
  config.vm.synced_folder '.', '/vagrant', type: 'nfs', disabled: true

  esx_password = File.read(".esx_password").strip()

  config.vm.provider :vmware_esxi do |esxi|
    esxi.esxi_hostname = '70.0.0.67'
    esxi.esxi_username = 'root'
    esxi.esxi_password = esx_password
    esxi.esxi_disk_store = 'HDD'
  end


  config.vm.provider :libvirt do |libvirt|
    libvirt.default_prefix = ''
  end


  config.vm.define :ubuntu1 do |dom|
    dom.vm.box = "generic/ubuntu1604"
    dom.vm.host_name = "ubuntu1"
    dom.vm.provision "shell", path: "run/ubuntu-run.sh"
    dom.vm.provider :vmware_esxi do |v|
      v.esxi_hostname = '70.0.0.67'
      v.esxi_username = 'root'
      v.esxi_password = esx_password
      v.esxi_disk_store = 'HDD'
      v.guest_memsize = '4096'
      v.guest_numvcpus = "2"
      v.guest_boot_disk_size = 50
      v.guest_storage = [100]
    end
  end

  config.vm.define :ubuntu2 do |dom|
    dom.vm.box = "generic/ubuntu1604"
    dom.vm.host_name = "ubuntu2"
    dom.vm.provision "shell", path: "run/ubuntu-run.sh"
    dom.vm.provider :vmware_esxi do |v|
      v.esxi_hostname = '70.0.0.67'
      v.esxi_username = 'root'
      v.esxi_password = esx_password
      v.esxi_disk_store = 'HDD'
      v.guest_memsize = '4096'
      v.guest_numvcpus = "2"
      v.guest_boot_disk_size = 50
      v.guest_storage = [100]
    end
  end

  config.vm.define :ubuntu3 do |dom|
    dom.vm.box = "generic/ubuntu1604"
    dom.vm.host_name = "ubuntu3"
    dom.vm.provision "shell", path: "run/ubuntu-run.sh"
    dom.vm.provider :vmware_esxi do |v|
      v.esxi_hostname = '70.0.0.67'
      v.esxi_username = 'root'
      v.esxi_password = esx_password
      v.esxi_disk_store = 'HDD'
      v.guest_memsize = '4096'
      v.guest_numvcpus = "2"
      v.guest_boot_disk_size = 50
      v.guest_storage = [100]
    end
  end

  config.vm.define :centos1 do |dom|
    dom.vm.box = "generic/centos7"
    dom.vm.host_name = "centos1"
    dom.vm.provision "shell", path: "run/rhel-run.sh"
    dom.vm.provider :vmware_esxi do |v|
      v.esxi_hostname = '70.0.0.67'
      v.esxi_username = 'root'
      v.esxi_password = esx_password
      v.esxi_disk_store = 'HDD'
      v.guest_memsize = '4096'
      v.guest_numvcpus = "2"
      v.guest_boot_disk_size = 50
      v.guest_storage = [100]
      v.guest_custom_vmx_settings = [['ethernet0.pcislotnumber','33']]
    end
  end

  config.vm.define :centos2 do |dom|
    dom.vm.box = "generic/centos7"
    dom.vm.host_name = "centos2"
    dom.vm.provision "shell", path: "run/rhel-run.sh"
    dom.vm.provider :vmware_esxi do |v|
      v.esxi_hostname = '70.0.0.67'
      v.esxi_username = 'root'
      v.esxi_password = esx_password
      v.esxi_disk_store = 'HDD'
      v.guest_memsize = '4096'
      v.guest_numvcpus = "2"
      v.guest_boot_disk_size = 50
      v.guest_storage = [100]
      v.guest_custom_vmx_settings = [['ethernet0.pcislotnumber','33']]
    end
  end


  config.vm.define :ubuntul1 do |dom|
    dom.vm.box = "generic/ubuntu1604"
    dom.vm.host_name = "ubuntul1"
    dom.vm.provision "shell", path: "run/ubuntu-run.sh"
    dom.vm.provider :libvirt do |v|
      v.memory = 4096
      v.cpus = 2
      v.disk_bus = "virtio"
      v.storage :file, :size => '100G'
    end
  end

  config.vm.define :ubuntul2 do |dom|
    dom.vm.box = "generic/ubuntu1604"
    dom.vm.host_name = "ubuntul2"
    dom.vm.provision "shell", path: "run/ubuntu-run.sh"
    dom.vm.provider :libvirt do |v|
      v.memory = 4096
      v.cpus = 2
      v.disk_bus = "virtio"
      v.storage :file, :size => '100G'
    end
  end


  config.vm.define :centosl do |dom|
    dom.vm.box = "centos/7"
    dom.vm.hostname = "centos"
    dom.vm.provision "shell", path: "run/rhel-run.sh"
    dom.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 1
      v.storage :file, :size => '100G'
    end
  end


  config.vm.define :atomic do |dom|
    dom.vm.box = "atomic"
    dom.vm.hostname = "atomic"
    dom.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
      v.disk_bus = "virtio"
      v.storage :file, :size => '100G'
    end
  end

  config.vm.define :atomichost do |dom|
    dom.vm.box = "centos/atomic-host"
    dom.disksize.size = "50GB"
    dom.vm.hostname = "atomic-host"
    dom.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
      v.disk_bus = "virtio"
      v.storage :file, :size => '100G'
    end
  end

  config.vm.define :win10 do |dom|
    dom.vm.box = "peru/windows-10-enterprise-x64-eval"
    dom.vm.hostname = "win10"
    dom.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
      v.disk_bus = "virtio"
    end
  end
  
  
  
  
  
  

end

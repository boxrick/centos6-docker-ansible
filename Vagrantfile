Vagrant.configure("2") do |config|
  config.ssh.username = 'root'
  config.vm.provider "docker" do |d|
    d.privileged = true
    d.image = "boxrick/centos6-docker-ansible"
    d.has_ssh = true
    d.remains_running = true
  end
  config.vm.provision "ansible" do |ansible|
    # Run playbook
    ansible.playbook = "test.yml"
  end
end

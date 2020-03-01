VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # General Vagrant VM configuration.
    
    # All VMs will run under centos7 exploitation system
    config.vm.box = "geerlingguy/centos7"

    # If true, Vagrant will automatically insert a keypair
    # to use for SSH, replacing Vagrant's default insecure key 
    # inside the machine if detected. By default, this is true
    config.ssh.insert_key = false


    # Configures synced folders on the machine, so that folders 
    # on your host machine can be synced to and from the guest machine
    # config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=775"], disabled: true
    
    # VM Provider
    config.vm.provider :virtualbox do |v|
        v.memory = 256
        v.linked_clone = true
    end

    # Web server:
    config.vm.define "loadbalancer" do |loadbalancer|
        loadbalancer.vm.hostname = "loadbalancer"
        # static ip address
        loadbalancer.vm.network :private_network, ip: "192.168.60.4"
        config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        SHELL
    
        config.vm.provision "shell", inline: <<-SHELL
        systemctl restart sshd.service
        SHELL
    end

    config.vm.define "webserver" do |webserver|
        webserver.vm.hostname = "webserver"
        # static ip address
        webserver.vm.network :private_network, ip: "192.168.60.5"
        config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        SHELL
    
        config.vm.provision "shell", inline: <<-SHELL
        systemctl restart sshd.service
        SHELL
    end

    config.vm.define "db" do |db|
        db.vm.hostname = "db"
        # static ip address
        db.vm.network :private_network, ip: "192.168.60.6"
        config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        SHELL
    
        config.vm.provision "shell", inline: <<-SHELL
        systemctl restart sshd.service
        SHELL
    end

    config.vm.define "app" do |app|
        app.vm.hostname = "app"
        # static ip address
        app.vm.network :private_network, ip: "192.168.60.7"
        config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        SHELL
    
        config.vm.provision "shell", inline: <<-SHELL
        systemctl restart sshd.service
        SHELL
    end

    config.vm.define "control" do |control|
        control.vm.hostname = "control"
        # static ip address
        control.vm.network :private_network, ip: "192.168.60.8"
        config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        SHELL
    
        config.vm.provision "shell", inline: <<-SHELL
        systemctl restart sshd.service
        SHELL
    end
end
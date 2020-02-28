pipeline {
 
    agent { 
        node { 
            label 'control' 
        } 
    }
    stages {

        stage('Git Clone') { 
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/di-amine/loadbalecer-Ansible.git'
            }
        }     
        stage('test connection') {
            steps {
                // Run the maven docker build
                echo "test connection to machine nodes"
                sh "ansible all -m ping"
            }
        }
        stage('provisioning machine') {
            steps {
                echo "create groupe et install htop"
                sh "ansible-playbook -i hosts installHop.yml"
            }
        }
        stage('provisioning machine webserver (install nginx)') {
            steps {
                echo "nstall htop nginx"
                sh "ansible-playbook -i hosts installnginx.yml"
            }
        }
        
    }
}
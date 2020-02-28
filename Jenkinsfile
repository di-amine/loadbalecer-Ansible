pipeline {

 // Some global default variables
    environment {
        MAVEN_IMAGE_NAME = 'mymaven'
        TOMCAT_IMAGE_NAME = 'mytomcat'
        TEST_LOCAL_PORT = 8888
        DOCKERHUB_CREDS = credentials('dockerhub')
    }

    parameters {
        string (name: 'GIT_BRANCH',       defaultValue: 'master',                           description: 'Git branch to build')
        string (name: 'DOCKER_REG',       defaultValue: 'docker-registry.my',               description: 'Docker registry')
        string (name: 'DOCKER_TAG',       defaultValue: 'v2.0',                             description: 'Docker tag')
        string (name: 'DOCKER_USR',       defaultValue: 'admin',                            description: 'Your docker repository user')
        string (name: 'DOCKER_PSW',       defaultValue: 'password',                         description: 'Your docker repository password')
    }
    
    
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
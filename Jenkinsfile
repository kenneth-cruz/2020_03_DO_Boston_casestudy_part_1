pipeline {
    environment {
        registry = "kennethcruz/kencruzcapstone"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Set Up') {
            steps {
                script {
                    sh 'rm -rf 2020_03_DO_Boston_casestudy_part_1'
                }
            }
        }
        stage('Cloning git repo') {
            steps {
                sh 'git clone https://github.com/kenneth-cruz/2020_03_DO_Boston_casestudy_part_1.git'
            }
        }
        stage('Building the image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Push the image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps{
                sh 'docker rmi $registry:$BUILD_NUMBER'
            }
        }
        stage('Execute Ansible'){
            steps {
                ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts.inv', playbook: 'ansible-playbook.yml'
            }
        }
    }
}
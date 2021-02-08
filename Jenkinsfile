pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git url: 'https://github.com/kenneth-cruz/2020_03_DO_Boston_casestudy_part_1'
            
            }
        }
        stage('Deploy') {
            steps {
                
                ansiblePlaybook(playbook: 'playbook.yml')
              
            }
        }
    }
}
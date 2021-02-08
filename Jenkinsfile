pipeline {
    agent any

    stages {
        stage('Clean workspace'){
					steps{
						script{
							sh 'rm -rf $PWD/2020_03_DO_Boston_casestudy_part_1'						
						}
					}
				}
        stage('Build') {
            steps {
                script{
                    sh 'git clone https://github.com/kenneth-cruz/2020_03_DO_Boston_casestudy_part_1'
                }
                
            }
        }
        stage('Deploy') {
            steps {
                
                ansiblePlaybook(playbook: 'playbook.yml')
              
            }
        }
    }
}
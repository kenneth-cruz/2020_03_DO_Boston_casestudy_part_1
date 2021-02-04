
pipeline { 
    environment { 
        registry = "kennethcruz/kencruzcapstone" 
        registryCredential = 'dockerhub_id' 
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
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/kenneth-cruz/2020_03_DO_Boston_casestudy_part_1.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
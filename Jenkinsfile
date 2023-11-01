pipeline {
    agent any
    stages {
        stage('Check') {
            steps {
                git branch: 'develop',credentialsId:'0-shingo', url:'https://github.com/Spharos-final-project-WOOYANO/Eureka-Server'
            }
        }

        stage('Build'){
            steps{
                script {
                    sh '''
                        chmod +x ./gradlew
                        ./gradlew build
                    '''
                    
                }
                    
            }
        }
        stage('DockerSize'){
            steps {
	    	script {
		
                sh '''
                    docker stop eureka-server || true
                    docker rm eureka-server || true
                    docker rmi server-img || true
                    docker build --tag server-img:latest .
		    docker images
                '''
		}

            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run --network spharos-network -d --name eureka-server server-img:latest'
            }
        }
    }
}


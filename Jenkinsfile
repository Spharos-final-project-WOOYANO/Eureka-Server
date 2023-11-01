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
                        pwd
                        chmod +x ./gradlew
                        ./gradlew build
			ls -al /var/
                    '''
                    
                }
                    
            }
        }
        stage('Deploy'){
            steps {
                sh '''
			ls -al /var/
                    docker stop eureka-server || true
                    docker rm eureka-server || true
                    docker rmi eureka-server-img || true
                    docker build -t eureka-server-img:latest .
		            docker run --network spharos-network -d -p 8761:8761 --name eureka-server eureka-server-img
                '''
            }
        }
    }
}

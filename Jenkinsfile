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
			ls -al ./src/main/resources/
                        chmod +x ./gradlew
                        ./gradlew build
                    '''
                    
                }
                    
            }
        }
        stage('DockerSize'){
            steps {
                sh '''
                    docker stop server || true
                    docker rm server || true
                    docker rmi server-img || true
                    docker build -t server-img:latest .
                '''
            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run --name -d server server-img'
            }
        }
    }
}



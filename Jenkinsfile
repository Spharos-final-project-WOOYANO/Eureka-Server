pipeline {
    agent any

    stages {
        stage('Check') {
            steps {
                git branch: 'develop',credentialsId:'sinyoung', url:'https://github.com/Spharos-final-project-WOOYANO/Eureka-Server'
            }
        }
        stage('Build'){
            steps{
                sh '''
                    cd server
                    chmod +x ./gradlew
                    ./gradlew build -x test
                '''
            }
        }
        stage('DockerSize'){
            steps {
                sh '''
                    cd server
                    docker stop Eureka-Server || true
                    docker rm Eureka-Server || true
                    docker rmi Eureka-Server-Img || true
                    docker build -t Eureka-Server-Img:latest .
                '''
            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run -d --name Eureka-Server -p 8080:8000 Eureka-Server-Img'
            }
        }
    }
}

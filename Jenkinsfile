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
                        ./gradlew build -x test
                    '''
                    
                }
                    
            }
        }
        stage('DockerSize'){
            steps {
                sh '''
                    docker stop eureka-server || true
                    docker rm eureka-server || true
                    docker rmi eureka-server-img || true
                    docker build -t eureka-server-img:latest .
                '''
            }
        }
        stage('Deploy'){
            steps{
                sh '''
                ls -al /usr/bin/docker
                ls -al /var/run/
                ls -al /var/run/docker.sock
                ls -al /var/jenkins_home/workspace/test/
                docker run -d --name eureka-server -p 8761:8000 eureka-server-img
                '''
            }
        }
    }
}

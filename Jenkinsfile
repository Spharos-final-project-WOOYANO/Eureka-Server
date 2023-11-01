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
                sh 'docker run --network spharos-network -d --name eureka-server -p 8761:8761 eureka-server-img'
            }
        }
    }
}


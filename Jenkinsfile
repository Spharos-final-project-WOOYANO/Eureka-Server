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
                        ./gradlew build -x test
                    '''
                    
                }
                    
            }
        }
        stage('DockerSize'){
            steps {
                script {

                    sh '''
                        docker stop server || true
                        docker rm server || true
                        docker rmi server-img || true
                        docker build --tag server-img:latest .
                    '''
            }

            }
        }
        stage('Deploy'){
            steps{
                 sh '''
                    docker run --network spharos-network --restart=always -d -p 8761:8761 --name server server-img:latest
                    '''
            }
        }
    }
}


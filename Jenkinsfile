pipeline {
    agent any
    stages {
        stage('Check') {
            steps {
                git branch: 'develop',credentialsId:'git-hook-PAT', url:'https://github.com/Spharos-final-project-WOOYANO/Eureka-Server'
            }
        }
        stage('Build'){
            steps{
                sh '''
                    pwd
                    echo "hello, World!"
                    chmod +x ./gradlew
                    def excludedFile = './src/main/resources/application.yml'
                        def fileList = sh(script: "find . -type f -not -name ${excludedFile}", returnStdout: true).trim()
                    ./gradlew build -x test
                '''
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
                sh 'docker run -d --name eureka-server -p 8761:8000 eureka-server-img'
            }
        }
    }
}

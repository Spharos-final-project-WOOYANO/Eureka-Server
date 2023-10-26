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
                script {

                    def excludedFile = 'application.yml'
                    def fileList = sh(script: "find . -type f -not -name ${excludedFile}", returnStdout: true).trim()

                    // 파일 목록을 환경 변수로 설정
                    env.EXCLUDE_FILE = excludedFile
                    sh '''
                    chmod +x ./gradlew
                    ./gradlew build -x test -PexcludeFile=${env.EXCLUDE_FILE}
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
                sh 'docker run -d --name eureka-server -p 8761:8000 eureka-server-img'
            }
        }
    }
}

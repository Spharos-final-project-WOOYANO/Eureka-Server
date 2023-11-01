pipeline {
  agent any
  stages {
    stage('Hello') {
      steps {
        echo "Hello"
      }
    }
    stage('Build') {
            steps {
				sh '''
					pwd
					chmod +x ./gradlew
					./gradlew build -x test
				'''
            }
        }
        stage('DockerSize') {
            steps {
                sh '''
					exit
                    docker stop server || true
                    docker rm server || true
                    docker rmi server-img || true
                    docker build -t server-img .
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
				exit
				docker run -d --name ssgpointapp -p 8000:8000 ssgpoint_be
					'''
            }
        }
  }
}

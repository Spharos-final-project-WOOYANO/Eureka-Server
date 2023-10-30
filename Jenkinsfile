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
		    cd /Wooyano-BE/server
                    ./gradlew build
                '''
            }
        }
        stage('DockerSize') {
            steps {
                sh '''
                    docker server || true
                    docker rm server || true
                    docker rmi test/server || true
                    docker build -t test/server .
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run --network spharos-network --name server -p 8761:8761 test/server'
            }
        }
  }
}

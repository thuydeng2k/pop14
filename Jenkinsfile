pipeline {
  agent any
  
  environment {
    DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
  }
  
  stages {
    stage('greeting') {
      steps {
        sh '''echo "hello world"
'''
      }
    }
    stage('build docker') {
      steps {
        sh '''docker build -t thuyngo2k/popcorn:$BUILD_NUMBER .
'''
      }
    }
    
    stage('tesing') {
      steps {
        sh '''docker run -t thuyngo2k/popcorn:$BUILD_NUMBER rails test
'''
      }
    }
    
    stage('docker push') {
      steps {
        sh '''docker login -u thuyngo2k -p $DOCKER_PASSWORD
docker push thuyngo2k/popcorn:$BUILD_NUMBER
'''
      }
    }
  }
}
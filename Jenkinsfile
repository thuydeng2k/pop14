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
    stage('testing') {
      steps {
        sh '''docker run thuyngo2k/popcorn:$BUILD_NUMBER rails test
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
    stage('deply to k8s') {
      steps {
        sh '''envsubst < deployment.yaml | kubectl apply -f -
'''
      }
    }
  }
}
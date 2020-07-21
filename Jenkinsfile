pipeline {
  environment {
    imageName = "allcloud-test"
    registry = "https://293013900746.dkr.ecr.us-east-1.amazonaws.com"
    registryCredential = 'ecr:us-east-1:2aa9ac16-639d-4c14-95ec-0ca005a39e45'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/valentinvladimir/hellojava.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imageName + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( registry, registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imageName:$BUILD_NUMBER"
      }
    }
  }
}

pipeline {
  agent {
    label 'codebuild'
    docker { image 'node:7-alpine' }
  }
  stages {
    stage('Build') {
      steps {
        sh 'node --version'
      }
    }
  }
}

node {
    
	
     //cleanup current user docker credentials
    sh 'rm  ~/.dockercfg || true'
    sh 'rm ~/.docker/config.json || true'

    env.AWS_ECR_LOGIN=true
  
	stage('Git') {
	  git 'https://github.com/valentinvladimir/hellojava'
        }
        stage('Build') {
          sh 'npm install'
        }
        stage('Test') {
          sh 'npm test'
        }
        stage('Building image') {
        docker.withRegistry('https://293013900746.ecr.eu-west-1.amazonaws.com', 'ecr:eu-west-1:bdae176b-c8c0-4140-8966-d8cf3722a1a4') {
            //build image
            def customImage = docker.build("my-image:${env.BUILD_ID}")
            
            //push image
            customImage.push()
        }
        }
}

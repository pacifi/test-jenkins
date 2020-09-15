// comment
pipeline {
 agent any
 stages {
        stage('Checkout-git'){
               steps{
		git poll: true, url: 'git@github.com:pacifi/test-jenkins.git'
               }
        }
        stage('CreateVirtualEnv') {
            steps {
				sh '''
					bash -c "virtualenv entorno_virtual && source entorno_virtual/bin/activate"
				'''

            }
        }
          stage('SonarQube analysis') {
    withSonarQubeEnv(credentialsId: '886994ee03d85506c1bac5f59e31541cf01cde5d', installationName: 'django') { 
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
    }
  }
        stage('InstallRequirements') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pip install -r requirements.txt"
                '''
            }
        }   
        stage('TestApp') {
            steps {
            	sh '''
            		bash -c "source ${WORKSPACE}/entorno_virtual/bin/activate &&  cd src && ${WORKSPACE}/entorno_virtual/bin/python ${WORKSPACE}/entorno_virtual/bin/pytest && cd .."
                '''
            }
        }  
        stage('RunApp') {
            steps {
            	sh '''
            		bash -c "source entorno_virtual/bin/activate ; ${WORKSPACE}/entorno_virtual/bin/python src/main.py &"
                '''
            }
        } 
        stage('BuildDocker') {
            steps {
            	sh '''
            		docker build -t apptest:latest .
                '''
            }
        } 
    
  }
}


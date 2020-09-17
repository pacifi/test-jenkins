// comment
pipeline {
 agent any
 stages {
        stage('Checkout-git'){
               steps{
		git poll: true, url: 'git@github.com:pacifi/test-jenkins.git'
               }
        }
          stage('Code Quality') {
                   steps {
                   sh '''
                    docker run --rm -v "$(pwd):/usr/src" sonarsource/sonar-scanner-cli -Dsonar.login=a41c74a59554a688706a9f12c33139a70e162175 -Dsonar.host.url=http://192.168.1.102:9000    -Dsonar.projectKey=django -Dsonar.sources=/usr/src
                   '''
                   }
                   }
       
       
      
    
  }
}


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
                    docker run --rm -v "${WORKSPACE}/:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.login=3237abe99eb459683c809a027366e21368584770 -Dsonar.host.url=http://192.168.1.102:9000    -Dsonar.projectKey=django2 -Dsonar.sources=/usr/src
                   '''
                   }
                   }
       
       
      
    
  }
  post { 
        always { 
            cleanWs()
        }
    }
}


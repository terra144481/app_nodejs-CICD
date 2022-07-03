pipeline {
     agent {
      label 'ubuntu'
     }
     stages {
        stage("Build") {
            steps {
                sh "sudo npm install"
                sh "sudo npm run build"               
            }
        }
          
        stage('Test') {
            steps {
                sh "sudo chmod a+x ./Jenkins/scripts/test.sh"
                sh "./Jenkins/scripts/test.sh "
                
            }
        }
          
        stage("Deploy") {
            steps {
                sh "sudo rm -rf /var/www/jenkins-react-app"
                sh "scp -r ${WORKSPACE}/build/* ubuntu@23.22.175.141:/var/www/jenkins-react-app/"
            }
        }
    }
}

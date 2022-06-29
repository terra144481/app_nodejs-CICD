pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "sudo npm install"
                sh "sudo npm run build"               
            }
        }
          
        stage('Test') {
            steps {
                sh "sudo pwd" 
                sh "sudo chmod a+x ./Jenkins/scripts/test.sh"
                sh "./Jenkins/scripts/test.sh "
                
            }
        }
          
        stage("Deploy") {
            steps {
                sh "sudo rm -rf /var/www/jenkins-react-app"
                sh "scp -r ${WORKSPACE}/build/* ubuntu@75.101.214.40:/var/www/jenkins-react-app/"
            }
        }
    }
}

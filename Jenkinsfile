pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "sudo npm install"
                sh "sudo npm run build"
                
            }
        }
        stage("Deploy") {
            steps {
                sh "sudo rm -rf /var/www/jenkins-react-app"
                sh "scp -r ${WORKSPACE}/build/* ubuntu@34.236.156.170:/var/www/jenkins-react-app/"
            }
        }
    }
}

pipeline {
    agent {
      label 'ubuntu'
     }
    stages {
        stage('Create infrastructure using Terraform') {
            steps {
                sh "sudo chmod a+x ./Jenkins/scripts/terraform_install.sh"
                sh "./Jenkins/scripts/terraform_install.sh "
                sh "sudo chmod a+x ./Jenkins/scripts/terraform_aws.sh"
                sh "./Jenkins/scripts/terraform_aws.sh"
                sh "sudo chmod a+x ./Jenkins/scripts/ansible.sh"
                sh "./Jenkins/scripts/ansible.sh"
            }
        }
       
        stage('Configure dev and prod env using Ansible') {
            steps {
                
                sh "./Jenkins/scripts/ansible_playbooks.sh"
            }
        }
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
                sh "scp -r ${WORKSPACE}/build/* ubuntu@54.226.153.126:/var/www/jenkins-react-app/"
            }
        }
        
    }
}

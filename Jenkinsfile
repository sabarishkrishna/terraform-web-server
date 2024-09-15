pipeline{
    agent any
    stages{
        stage('checkout from GIT'){
            steps{
               git branch: 'master', url: 'https://github.com/sabarishkrishna/terraform-web-server.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform plan'){
           steps{
                sh 'terraform plan'
           }
        }

        stage('Terraform Apply'){
           steps{
                sh 'terraform apply --auto-approve'
           }
        }
    }   
}

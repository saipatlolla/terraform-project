pipeline {
    agent {
        label 'terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'terraform-project',
                    url: 'https://github.com/saipatlolla/terraform-project.git'
            }
        }
        
        stage('Terraform Format'){
            steps{
                sh 'terraform fmt -check -recursive'
            }
        }
        
        stage('terraform init'){
            steps{
                dir('environments/dev'){
                    sh 'terraform init'
                }
            }
        }
        
        stage('terraform validate'){
            steps{
                dir('environments/dev'){
                    sh 'terraform validate'
                }
            }
        }
      
        stage('terraform plan'){
            steps{
                dir('environments/dev'){
                    sh 'terraform plan'
                }
            
            }  

        }

    }
}

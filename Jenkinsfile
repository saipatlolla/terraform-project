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
    }
}

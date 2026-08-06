pipeline {

    agent {
        label 'terraform'
    }

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    stages {

        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'git@github.com:saipatlolla/terraform-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Apply'
                

                sh '''
                    terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment successful'
        }

        failure {
            echo 'Terraform deployment failed'
        }
    }
}

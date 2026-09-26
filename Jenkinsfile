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
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show -no-color tfplan > tfplan.txt' 
                }
            
            }  

        }

        stage('Publish Terraform Plan'){
            steps{
                dir('environments/dev'){
                    archiveArtifacts artifacts: 'tfplan.txt',
                        fingerprint: true
                }
            }
 
        }
        
        stage('Devops approval'){
            steps{
                input(
                    message: 'Terraform plan reviewed. Approve to apply?',
                    ok: 'Approve'
                    submitter: 'shanker'
                 )
            }

        }

        stage('terraform apply'){
            steps{
                dir('environments/dev'){
                    sh 'terraform apply tfplan '
                }
            }
        }

    }
}

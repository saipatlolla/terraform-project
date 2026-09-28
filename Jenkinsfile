pipeline {
    agent {
        label 'terraform'
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev','qa','prod'],
            description: 'Terraform environment to deploy'
        )

    }

    stages {
        
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
            when {
                branch 'main'
            }

            steps{
                dir('environments/dev'){
                    archiveArtifacts artifacts: 'tfplan.txt',
                        fingerprint: true
                }
            }
 
        }
        
        stage('Devops approval'){
            when {
                branch 'main'
            }

            steps{
                input(
                    message: 'Terraform plan reviewed. Approve to apply?',
                    ok: 'Approve',
                    submitter: 'shanker'
                 )
            }

        }

        stage('terraform apply'){
            when {
                branch 'main'
            }    

            steps{
                dir('environments/dev'){
                    sh 'terraform apply tfplan '
                }
            }
        }

    }
}

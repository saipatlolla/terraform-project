pipeline {
    agent {
        label 'terraform'
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev','qa','prod'],
            description: 'Terraform environments to deploy'
        )

    }

    stages {
        
        stage('Terraform Format'){
            steps{
                sh 'terraform fmt -check -recursive'
            }
        }
        
        stage('Terraform init'){
            steps{
                dir("environments/${params.ENVIRONMENT}"){
                    sh 'terraform init'
                }
            }
        }
        
        stage('terraform validate'){
            steps{
                dir("environments/${params.ENVIRONMENT}"){
                    sh 'terraform validate'
                }
            }
        }
      
        stage('terraform plan'){
            steps{
                dir("environments/${params.ENVIRONMENT}"){
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
                dir("environments/${params.ENVIRONMENT}"){
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
                    message: "Terraform ${params.ENVIRONMENT} plan reviewed. Approve to apply?",
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
                dir("environments/${params.ENVIRONMENT}"){
                    sh 'terraform apply tfplan '
                }
            }
        }

    }
}

pipeline {
agent any

environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds')
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
}
stages{
  stage('Terraform Init'){
    steps {
	    script {
            sh 'terraform init'
        }
    }
  }
  stage('Terraform Plan'){
    steps {
	    script {
            sh 'terraform plan'
        }
    }
  }
   stage('Terraform Apply'){
     when { branch 'main'}
     steps {
 	    script {
             sh 'terraform apply -auto-approve'
         }
     }
   }
}
}

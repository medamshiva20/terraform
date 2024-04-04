pipeline 
agent { node {label 'label1'} }

options{
    ansiColor('xterm')
    stages {
        stage('Init')
        {
            steps{
                sh'''
            cd terraform/roboshop-infra/
            ls -ltrh
            pwd
            terraform init
            '''
            }
            
        }
        stage('Plan')
        {
            steps{
            sh'''
            cd terraform/roboshop-infra/
            ls -ltrh
            pwd
            terraform plan
            '''
            }

        }
    }
    post{
        always{
            echo "I will run this action whether job success or not"
        }
        success{
            echo "I will run this action if the job only success"
        }
        failure{
            echo "I will run this action if the job only failure"
        }
    }
}
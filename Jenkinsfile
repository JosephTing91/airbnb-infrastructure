def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]


pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning project codebase'
                git branch: 'main', url: 'https://github.com/JosephTing91/airbnb-infrastructure.git'
                sh 'ls'

            }
        }
        stage('Verify TF version') {
            steps {
                echo 'verify tf version'                
                sh 'terraform --version'

            }
        }
        stage('TF init') {
            steps {
                echo 'init tf project'                
                sh 'terraform init'

            }
        }
        stage('TF validate') {
            steps {
                echo 'validate tf project'                
                sh 'terraform validate'

            }
        }
        stage('TF plan') {
            steps {
                echo 'plan tf project'                
                sh 'terraform plan'

            }
        }
        stage('checkov scan') {
            steps {
                sh """
                sudo pip3 install checkov
                checkov -d . --skip-check CKV2_AWS_41,CKV_AWS_135
                """

            }
        }
       stage('Manual approval') {
            steps {
                input 'Approval required for deployment'
            }
        }
        
        stage('TF Apply') {
            steps {
                echo 'apply tf project'                
                sh 'sudo terraform apply --auto-approve'

            }
        }
    }
        post {
           always {
                echo "I will always say hello"
                slackSend channel: 'testchannel', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: (<${env.BUILD_URL}|Open>)"
            }
        }
}



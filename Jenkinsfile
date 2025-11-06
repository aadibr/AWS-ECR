pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/aadibr/AWS-ECR.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app:latest .'
            }
        }
        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | \
                docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com
                '''
            }
        }
        stage('Tag & Push') {
            steps {
                sh '''
                docker tag my-app:latest 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
                docker push 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
                '''
            }
        }
    }
}


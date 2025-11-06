pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'          // Your AWS region
        AWS_ACCOUNT_ID = '123456789012'   // Your AWS account ID
        IMAGE_NAME = 'my-app'             // Docker image name
    }

    stages {
        stage('Check Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Checkout Code') {
            steps {
                git 'https://github.com/aadibr/AWS-ECR.git'  // HTTPS URL
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Login to AWS ECR') {
            steps {
                echo "Logging in to AWS ECR..."
                sh """
                aws ecr get-login-password --reg

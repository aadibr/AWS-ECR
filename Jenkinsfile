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
                git 'https://github.com/aadibr/AWS-ECR.git'
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
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                """
            }
        }

        stage('Tag Docker Image') {
            steps {
                echo "Tagging Docker image..."
                sh """
                    docker tag ${IMAGE_NAME}:latest \
                    ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to ECR..."
                sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        success {
            echo "Docker image pushed to AWS ECR successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}


pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'                  // Your AWS region
        AWS_ACCOUNT_ID = '123456789012'      // Your AWS account ID
        IMAGE_NAME = 'my-app'                     // Docker image name
    }

   stage('Check Docker') {
    steps {
        sh 'docker --version'
    }
}

        stage('Checkout Code') {
            steps {
                git 'git@github.com:aadibr/AWS-ECR.git'  // Replace with your Git repository
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${my-app} ."
            }
        }

        stage('Login to AWS ECR') {
            steps {
                echo "Logging in to AWS ECR..."
                sh """
                aws ecr get-login-password --region ${us-east-1} | \
                docker login --username AWS --password-stdin ${123456789012}.dkr.ecr.${us-east-1}.amazonaws.com
                """
            }
        }

        stage('Tag Docker Image') {
            steps {
                echo "Tagging Docker image for ECR..."
                sh "docker tag ${my-app}:latest ${123456789012}.dkr.ecr.${AWS_REGION}.amazonaws.com/${my-app}:latest"
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to ECR..."
                sh "docker push ${123456789012}.dkr.ecr.${us-east-1}.amazonaws.com/${my-app}:latest"
            }
        }
    }

    post {
        success {
            echo "Docker image pushed to AWS ECR successfully!"
        }
        failure {
            echo "Pipeline failed. Check the logs for errors."
        }
    }
}

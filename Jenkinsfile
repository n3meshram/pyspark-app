pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "735263431546.dkr.ecr.ap-south-1.amazonaws.com/pyspark-demo"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/n3meshram/pyspark-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t pyspark-demo .'
            }
        }

        stage('Login to ECR') {
            steps {
                bat '''
                aws ecr get-login-password --region %AWS_REGION% | docker login --username AWS --password-stdin %ECR_REPO%
                '''
            }
        }

        stage('Tag Image') {
            steps {
                bat 'docker tag pyspark-demo:latest %ECR_REPO%:latest'
            }
        }

        stage('Push to ECR') {
            steps {
                bat 'docker push %ECR_REPO%:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f job.yaml'
            }
        }
    }
}
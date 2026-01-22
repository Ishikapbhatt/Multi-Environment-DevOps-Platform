pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['dev', 'qa', 'prod'], description: 'Deployment Environment')
  }

  environment {
    AWS_REGION = "ap-south-1"
    IMAGE_NAME = "student-app"
  }

  stages {

    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/org/multi-env-devops.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t $IMAGE_NAME:${BUILD_NUMBER} docker/"
      }
    }

    stage('Push Image') {
      steps {
        sh "docker tag $IMAGE_NAME:${BUILD_NUMBER} repo/$IMAGE_NAME:${BUILD_NUMBER}"
        sh "docker push repo/$IMAGE_NAME:${BUILD_NUMBER}"
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh """
          terraform init
          terraform workspace select ${params.ENV} || terraform workspace new ${params.ENV}
          terraform apply -auto-approve
          """
        }
      }
    }

    stage('Deploy to Kubernetes') {
      when {
        expression { params.ENV != 'prod' }
      }
      steps {
        sh "kubectl apply -f k8s/${params.ENV}/"
      }
    }

    stage('Prod Approval') {
      when {
        expression { params.ENV == 'prod' }
      }
      steps {
        input message: 'Approve Production Deployment'
      }
    }

    stage('Prod Blue-Green Deploy') {
      when {
        expression { params.ENV == 'prod' }
      }
      steps {
        sh "kubectl apply -f k8s/prod/"
      }
    }
  }
}


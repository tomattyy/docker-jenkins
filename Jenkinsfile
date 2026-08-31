pipeline {

    agent any

    tools {
        nodejs 'Node24'
    }

    triggers {
        githubPush()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build / Instalação') {
            steps {
                sh 'npm ci'
            }
        }

        stage('SAST') {
            steps {
                sh 'npm audit --audit-level=high'
            }
        }

        stage('Lint & Quality') {
            steps {
                sh 'npm run lint'
            }
        }


        stage('Testes') {
            steps {
                sh 'npm test'
            }
        }
    }

    post {

        always {
            cleanWs()
        }

        success {
            echo 'Pipeline executada com sucesso!'
        }

        failure {
            echo 'Pipeline falhou!'
        }
    }
}
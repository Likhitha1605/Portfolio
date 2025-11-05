pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Likhitha1605/Portfolio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build --no-cache -t portfolio:latest  .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat 'docker stop portfolio || exit 0'
                bat 'docker rm portfolio || exit 0'
            }
        }

        stage('Run New Container') {
            steps {
                bat 'docker run -d -p 8081:80 --name portfolio portfolio:latest'
            }
        }
    }

    post {
        success {
            echo "✅ Portfolio deployed successfully at http://localhost:8081"
        }
        failure {
            echo "❌ Build failed! Check logs."
        }
    }
}

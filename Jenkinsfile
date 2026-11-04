pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Fetching source code'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the website'
                sh '''
                    mkdir -p build
                    cp -r app/* build/
                    test -f build/index.html
                    test -f build/style.css
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing the website'
                sh '''
                    grep -q "<h1>" build/index.html
                    grep -q "style.css" build/index.html
                    echo "All tests passed successfully"
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying website to Docker'
                sh '''
                    docker cp build/. devops-cicd-website:/usr/share/nginx/html/
                    echo "Website deployed successfully"
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed. Check the console output.'
        }
    }
}

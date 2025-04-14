pipeline {
    agent any
    
    environment {
        // Default Java Home for Jenkins
        JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
        PATH = "${JAVA_HOME}/bin:${PATH}"
    }

    stages {
        // Stage 1: Container Build - Required for check-in 2 (1 point)
        stage('Build Container') {
            steps {
                echo 'Building Docker container from PR code...'
                script {
                    // Extract PR information for custom tags
                    def prNumber = env.CHANGE_ID ? env.CHANGE_ID : 'local'
                    def shortCommit = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                    def imageTag = "demo-app:pr-${prNumber}-${shortCommit}"
                    
                    // Build Docker image
                    sh "docker build -t ${imageTag} ."
                    
                    echo "Successfully built container with tag: ${imageTag}"
                }
            }
        }
        
        // Stage 2: Unit Tests - Required for check-in 2 (2 points)
        stage('Unit Tests') {
            environment {
                // Override JAVA_HOME to use JDK 11 for this stage
                JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
                PATH = "${JAVA_HOME}/bin:${PATH}"
            }
            steps {
                sh './gradlew test'
            }
            post {
                always {
                    junit '**/build/test-results/test/*.xml'
                }
            }
        }
        
        // Stage 3: SonarQube Analysis - Required for check-in 2 (2 points)
        stage('Static Analysis') {
            environment {
                // Override JAVA_HOME to use JDK 11 for this stage
                JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
                PATH = "${JAVA_HOME}/bin:${PATH}"
            }
            steps {
                sh './gradlew sonarqube -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login="admin" -Dsonar.password="ensf400"'
                // Wait for SonarQube to process results
                sleep 5
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
        success {
            echo 'Pipeline succeeded! All stages passed.'
        }
        failure {
            echo 'Pipeline failed! Check the logs for details.'
        }
    }
}

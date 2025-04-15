pipeline {
    agent any
    
    environment {
        // Default Java Home for Jenkins (JDK 17)
        JAVA_HOME = '/usr/lib/jvm/java-17-openjdk'
        PATH = "${JAVA_HOME}/bin:${PATH}"
    }
    
    stages {
        stage('Build') {
            environment {
                // Override JAVA_HOME to use JDK 11 for this stage
                JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
                PATH = "${JAVA_HOME}/bin:${PATH}"
            }
            steps {
                sh './gradlew clean assemble'
            }
        }
        
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
        
        stage('SonarQube Analysis') {
            environment {
                // Override JAVA_HOME to use JDK 11 for this stage
                JAVA_HOME = '/usr/lib/jvm/java-11-openjdk'
                PATH = "${JAVA_HOME}/bin:${PATH}"
            }
            steps {
                sh './gradlew sonarqube -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login="admin" -Dsonar.password="ensf400"'
            }
        }
    }
}

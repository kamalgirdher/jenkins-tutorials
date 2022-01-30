Tutorial 5. Pipeline with post actions

JENKINSFILE2

Windows
[Note :use sh instead of bat for Linux]
```
pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                bat 'python -V'
            }
        }
    }
 post {
        always {
            echo 'Always'
        }
        success {
            echo 'Only on SUCCESS'
        }
        failure {
            echo 'Only on Failure'
        }
        unstable {
            echo 'Only if run is unstable'
        }
        changed {
            echo 'Only if status changed from Success to Failure or vice versa w.r.t. last run.'
        }
    }
}
```

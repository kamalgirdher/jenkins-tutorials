# Pipeline with post actions

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

 <p>The steps alway run in order: <b> always, changed, success, unstable, failure </b></p>

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>

# Tutorial 9. Virtual Machine agent

JENKINSFILE 4
```
pipeline {
    agent {
        label vmubuntu
    }
    stages {
        stage('pre -build') {
            steps {
                bat 'echo Pre-build'
            }
        }
        stage('build') {
            steps {
                bat 'echo Build in progress.'
            }
        }
        stage('Unit tests') {
            steps {
                bat 'echo Running unit tests'
            }
        }
        stage('deploy') {
            steps {
                bat 'echo Deploying build'
            }
        }
        stage('Regression tests') {
            steps {
                parallel(
                    chrome : {
                        bat 'echo Running E2E tests on chrome'
                    },
                    firefox : {
                        bat 'echo Running E2E tests on chrome'
                    },
                    safari : {
                        bat 'echo Running E2E tests on chrome'
                    }
                )
                
            }
        }
        stage('Release to prod') {
            steps {
                bat 'echo Releasing to prod'
            }
        }
    }
 post {
        always {
            echo 'Cleanup after everything!'
        }
    }
}
```

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>

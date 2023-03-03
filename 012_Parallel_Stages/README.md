# Parallel steps in a stage

JENKINSFILE 4
### For `Windows`
```
pipeline {
    agent any
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
                parallel{
                        stage('chrome') {
                            steps {
                                bat 'echo Running E2E tests on chrome'
                            }
                        }
                        stage('firefox') {
                            steps {
                                bat 'echo Running E2E tests on firefox'
                            }
                        }
                        stage('safari') {
                            steps {
                                bat 'echo Running E2E tests on safari'
                            }
                        }
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

### For `Linux`
```
pipeline {
    agent any
    stages {
        stage('pre -build') {
            steps {
                sh 'echo Pre-build'
            }
        }
        stage('build') {
            steps {
                sh 'echo Build in progress.'
            }
        }
        stage('Unit tests') {
            steps {
                sh 'echo Running unit tests'
            }
        }
        stage('deploy') {
            steps {
                sh 'echo Deploying build'
            }
        }
        stage('Regression tests') {
            parallel {
                stage('chrome') {
                    steps {
                        sh 'echo Running E2E tests on chrome'
                    }
                }
                stage('firefox') {
                    steps {
                        sh 'echo Running E2E tests on firefox'
                    }
                }
                stage('safari') {
                    steps {
                        sh 'echo Running E2E tests on safari'
                    }
                }
            }
        }
        stage('Release to prod') {
            steps {
                sh 'echo Releasing to prod'
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

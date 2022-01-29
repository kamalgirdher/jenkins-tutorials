# jenkins-tutorials

Youtube : https://www.youtube.com/c/xtremeexcel

1. Jenkins installation


2. Github account, github plugin, github token


3. Pipeline using Pipeline script

    Dashboard > New Item > Pipeline
    Definition = Pipeline script
    Enter script
    
    Windows
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
    }
    ```

    Linux
    ```
    pipeline {
       agent any
        stages {
            stage('build') {
                steps {
                    sh 'python -V'
                }
            }
        }
    }
    ```


4. JENKINSFILE using SCM

    Dashboard > New Item > Pipeline
    Pipeline script from SCM
    Enter github repo
    Credentials
    Specify branch
    Script Path = JENKINSFILE1

    Windows
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
    }
    ```

    Linux
    ```
    pipeline {
       agent any
        stages {
            stage('build') {
                steps {
                    sh 'python -V'
                }
            }
        }
    }
    ```

5. Pipeline with post actions

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

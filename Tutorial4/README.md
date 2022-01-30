Tutorial 4. JENKINSFILE using SCM

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

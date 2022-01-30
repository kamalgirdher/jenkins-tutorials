# jenkins-tutorials

Youtube : https://www.youtube.com/c/xtremeexcel

1. Jenkins installation



2. Github account, github plugin, github token

    If you don't have a github account, then visit https://github.com/signup and create an account.

    If you are not having Github plugins installed on Jenkins, then follow these steps

        a. Go to Manage Jenkins and then click on Manage Plugins.

<p align="center">
    <img src="/images/manage_jenkins.png" width="30%" height="30%">
</p>

        b. Install git and github plugins and restart jenkins.

<p align="center">
    <img src="/images/git_plugin.png" width="30%" height="30%">
</p>

<p align="center">
<img src="/images/github_plugin.png" width="30%" height="30%">
</p>


    If you have not created a token for github authentication before, follow the steps:

        a. Go to settings.

<p align="center">
<img src="/images/settings.png" width="70%" height="70%">
</p>

        b. Click on Developer Settings.

<p align="center">
<img src="/images/developer_settings.png" width="30%" height="30%">
</p>


        c. Click on Personal Access token. Then click on Generate new token. Copy the token and save it somewhere for future reference.

        d. Go to credentials manager in Jenkins and add username and token for authentication.


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

7. Multiple Stages

JENKINSFILE3
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
            steps {
                bat 'echo Running E2E tests'
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

7. Blue ocean

8. Parallel steps in a stage

JENKINSFILE 4
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
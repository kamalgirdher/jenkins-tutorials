# Tutorial 11. Pipeline Concepts

## Directives
In Descriptive pipelines, all the blocks we use like pipeline, stages, steps etc are known as directives. Let's explore few more directives that we have not visited yet.


------

#### Environment Variables
The environment directive specifies a sequence of key-value pairs which will be defined as environment variables for all steps, or stage-specific steps, depending on where the environment directive is located within the Pipeline.

```
 environment { 
    fname = 'kamal'
}
```

<b>Scope</b>

- If defined at pipeline level, it will apply to all steps within the Pipeline.

```
pipeline {
    agent any
    environment { 
        fname = 'kamal'
    }
    stages {
        stage('Example') {
            steps {
                sh 'echo HELLO'
            }
        }
    }
}
```

- If defined within a stage, it will only be accessible to steps within the stage.

```
pipeline {
    agent any
    stages {
        stage('one') {
            environment { 
                fname = 'kamal'
            }
            steps {
                sh 'echo HELLO'
            }
        }
        stage('two') {
            steps {
                sh 'echo WORLD'
            }
        }
    }
}
```

This directive supports a special helper method credentials() which can be used to access pre-defined Credentials by their identifier in the Jenkins environment.

If you want to access credentials stored in Jenkins Credential Manager through the pipeline, then you need to use this credentials() method.

And once you put that in the environment variable (say GIT_CREDS), you can access username and password with the names "GIT_CREDS_USR" and "GIT_CREDS_PSW".

```
pipeline {
    agent any
    environment {
        GIT_CREDS = credentials('gitCredentials')
    }
    stages {
        stage('abc') {
            steps {
                sh 'echo "Git user is $GIT_CREDS_USR"'
                sh 'echo "Git password is $GIT_CREDS_PSW"'
            }
        }
    }
}
```

------

#### options

options is another directive through which we can control various things like

buildDiscarder
checkoutToSubdirectory
disableConcurrentBuilds
disableResume
newContainerPerStage
overrideIndexTriggers
preserveStashes
quietPeriod
retry
skipDefaultCheckout
skipStagesAfterUnstable
timeout
timestamps
parallelsAlwaysFailFast

For details: https://www.jenkins.io/doc/book/pipeline/syntax/#available-options

------

#### parameters


------

#### triggers


------

#### tools


------

#### input


------

#### when



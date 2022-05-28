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
    agent {
        label 'ubuntuNode1'
    }
    environment { 
        fname = 'kamal'
    }
    stages {
        stage('Example') {
            steps {
                sh 'echo "HELLO ${fname}"'
            }
        }
    }
}
```

- If defined within a stage, it will only be accessible to steps within the stage.

```
pipeline {
    agent {
        label 'ubuntuNode1'
    }
    stages {
        stage('one') {
            environment { 
                fname = 'kamal'
            }
            steps {
                sh 'echo "HELLO ${fname}"'
            }
        }
        stage('two') {
            steps {
                sh 'echo "Hello ${fname}"'
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

```
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
```

For details: https://www.jenkins.io/doc/book/pipeline/syntax/#available-options


```
pipeline {
    agent any
    stages {
        stage ('one') {
            options{
                retry(3)
            }
            steps {
               error ('ERROR') 
            }
        }
        stage ('two') {
            steps {
               echo 'KAMAL'
            }
        }
    }
}
```

<p align="center">
<img src="/images/options_retry.png" width="40%" height="40%">
</p>


------

#### parameters

A very rich feature of jenkins is that jobs can be parameterized. In pipelines, we have a directive named as parameters.The values for these user-specified parameters are made available to Pipeline steps via the params object.

```
pipeline {
    agent any
    parameters {
        string(name: 'NAME', defaultValue: 'Uthred', description: 'Enter your name')
        choice(name: 'CITY', choices: ['Bebbanburg', 'Mercia', 'East Anglia'], description: 'Choose your city')
    }
    stages {
        stage('Example') {
            steps {
                echo "Hello ${params.NAME} of ${params.CITY}"
            }
        }
    }
}
```
To see complete list of parameters, you may refer https://www.jenkins.io/doc/book/pipeline/syntax/#parameters


------

#### triggers

The triggers directive defines the automated ways in which the Pipeline should be re-triggered.

The most popular alternate for triggers is 'Web-hooks', if you are using SCM like Github or bitbuket. These webhooks initiate the pipeline when there is a code change/bracnch addition/PR creation on the repository.

The triggers work in different way. These infact allow us to run pipeline as per <b>cron</b> schedule, polling SCM (<b>pollSCM</b>) for any changes or through <b>upstream</b> jobs.

##### cron
```
triggers {
    cron('H */4 * * 1-5')
}
```
For cron syntax, you may refer https://www.jenkins.io/doc/book/pipeline/syntax/#cron-syntax

##### pollSCM
```
triggers {
    pollSCM('H */4 * * 1-5')
}
```

##### upstream
```
triggers {
    upstream(upstreamProjects: 'job1', threshold: hudson.model.Result.SUCCESS)
}
```


------

#### tools

We can use tools directive to install few tools through the pipeline. These tools are:

```
maven
jdk
gradle
```

and we can add the following in our pipeline:

```
tools {
    maven 'apache-maven-3.0.1' 
}
```

------

#### input

The input directive allows us to ask user for input.

```
pipeline {
    agent any
    stages {
        stage('one') {
            input {
                message "Enter you Name"
                parameters {
                    string(name: 'FIRSTNAME', defaultValue: 'Kamal')
                }
            }
            steps {
                echo "Hello ${FIRSTNAME}"
            }
        }
    }
}
```

------

#### when

```
pipeline {
    agent any
    environment{
        abc = "HELLO"
    }
    stages {
        stage('one') {
            when {s
                environment name: 'abc', value : 'HELLO'
            }
            steps {
                echo 'HELLO there!!'
            }
        }
    }
}
```



```
pipeline {
    agent any
    environment{
        abc = "HELLO"
        efg = "HI"
    }
    stages {
        stage('one') {
            when {
                anyOf{
                    environment name: 'abc', value : 'HELLO'
                    environment name: 'efg', value : 'KAMAL'
                }
            }
            steps {
                echo 'HELLO there!!'
            }
        }
    }
}
```
    NOTE: Please go through all the options we have with "when" block at least once.
    https://www.jenkins.io/doc/book/pipeline/syntax/#when


------

#### Flow Control (Scripted)

<b>if..else</b>

```
pipeline {
    agent any
    environment{
        fname = "KAMAL"
    }
    stages {
        stage('one') {
            steps{
                script{
                    if (env.fname == 'KAMAL') {
                        echo 'HELLO KAMAL'
                    }
                    else{
                        echo 'I do not know you!'
                    }
                }
            }
            
        }
    }
}
```

<b>try...catch</b>

```
pipeline {
    agent any
    environment{
        fname = "KAMAL"
    }
    stages {
        stage('one') {
            steps{
                script{
                    try{
                        sh 'hello'
                    }
                    catch{
                        echo 'Error occured!!!!'
                    }
                }
            }
            
        }
    }
}
```
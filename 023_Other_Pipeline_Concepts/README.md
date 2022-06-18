# Other Pipeline Concepts

## Directives
In Descriptive pipelines, all the blocks we use like pipeline, stages, steps etc are known as directives. Let's explore few more directives that we have not visited yet.

### triggers

The triggers directive defines the automated ways in which the Pipeline should be re-triggered.

The most popular alternate for triggers is 'Web-hooks', if you are using SCM like Github or bitbuket. These webhooks initiate the pipeline when there is a code change/bracnch addition/PR creation on the repository.

The triggers work in different way. These infact allow us to run pipeline as per <b>cron</b> schedule, polling SCM (<b>pollSCM</b>) for any changes or through <b>upstream</b> jobs.

#### cron
```
triggers {
    cron('H */4 * * 1-5')
}
```
For cron syntax, you may refer https://www.jenkins.io/doc/book/pipeline/syntax/#cron-syntax

#### pollSCM
```
triggers {
    pollSCM('H */4 * * 1-5')
}
```

#### upstream
```
triggers {
    upstream(upstreamProjects: 'job1', threshold: hudson.model.Result.SUCCESS)
}
```


------

### tools

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

### input

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

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>
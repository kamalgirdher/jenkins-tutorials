# Options

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


<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>

# Sequential Stages

```
pipeline {
    agent {
        label 'ubuntuNode1'
    }
    stages{
        stage('stage1'){
            steps{
                echo 'inner1'
            }
        }
        stage('stage2'){
            steps{
                echo 'stage2'
            }
        }
        stage('stage3'){
            steps{
                echo 'stage3'
            }
        }
    }
}
```


```
pipeline {
    agent {
        label 'ubuntuNode1'
    }
    stages{
        stage('stage1'){
            stages{
                stage('inner1'){
                    steps{
                        echo 'inner1'
                    }
                }
            }
        }
        stage('stage2'){
            steps{
                echo 'stage2'
            }
        }
        stage('stage3'){
            steps{
                echo 'stage3'
            }
        }
    }
}
```

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>

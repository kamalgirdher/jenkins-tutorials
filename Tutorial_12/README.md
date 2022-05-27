# Tutorial 12. Sequential Stages vs Parallel

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
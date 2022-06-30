# When directive

```
pipeline {
    agent any
    environment{
        abc = "HELLO"
    }
    stages {
        stage('one') {
            when {
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



<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>

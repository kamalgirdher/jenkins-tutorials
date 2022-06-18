# Pipeline using Pipeline script

Dashboard > New Item > Pipeline

<p align="left">
<img src="/images/create_pipeline.png" width="60%" height="60%">
</p>


Definition = Pipeline script

<p align="left">
<img src="/images/first_pipeline_script.png" width="60%" height="60%">
</p>


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

Output:

<p align="left">
<img src="/images/first_pipeline_script_output.png" width="60%" height="60%">
</p>


<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>

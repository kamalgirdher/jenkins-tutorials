# Tutorial 3. Pipeline using Pipeline script

Dashboard > New Item > Pipeline

<p align="center">
<img src="/images/create_pipeline.png" width="60%" height="60%">
</p>


Definition = Pipeline script

<p align="center">
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

<p align="center">
<img src="/images/first_pipeline_script_output.png" width="60%" height="60%">
</p>

# Tutorial 9. Virtual Machine agent

To set up an agent on a VM, we first need to have the VM on same network. For this, I created a VM using Oracle Virtualbox and installed Ubuntu on it.

## Steps to Create VM:
1. Download and install virtualbox > https://www.virtualbox.org/wiki/Downloads
2. Create a new VM and install ubuntu. [Link](https://brb.nci.nih.gov/seqtools/installUbuntu.html)

## Setps to Configure Network:

1. Open Oracle virtualbox manager.
2. Select the VM and open settings.
3. Go to network.
4. Replace NAT adapder in Adapter 1 with Bridge Adapter.

<p align="center">
<img src="/images/ubuntuNetworkBridge.png" width="45%" height="45%">
</p>

And we are good to launch the VM.


## One time Installation on VM:

```
sudo apt update
sudo apt-get install openssh-server
```




JENKINSFILE 5
```
pipeline {
    agent {
        label 'vmubuntu'
    }
    stages {
        stage('pre -build') {
            steps {
                sh 'echo Pre-build'
            }
        }
        stage('build') {
            steps {
                sh 'echo Build in progress.'
            }
        }
        stage('Unit tests') {
            steps {
                sh 'echo Running unit tests'
            }
        }
        stage('deploy') {
            steps {
                sh 'echo Deploying build'
            }
        }
        stage('Regression tests') {
            steps {
                parallel(
                    chrome : {
                        sh 'echo Running E2E tests on chrome'
                    },
                    firefox : {
                        sh 'echo Running E2E tests on chrome'
                    },
                    safari : {
                        sh 'echo Running E2E tests on chrome'
                    }
                )
                
            }
        }
        stage('Release to prod') {
            steps {
                sh 'echo Releasing to prod'
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

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>

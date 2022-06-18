# Virtual Machine agent

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
<img src="/images/ubuntuNetworkBridge.png" width="65%" height="65%">
</p>

And we are good to launch the VM.


## One time Installation on VM:

```
sudo apt update
sudo apt-get install openssh-server
```

## Add new agent on Jenkins
1. Go to Manage Jenkins. Go to Manage Nodes and Clouds.
2. Go to New Node. Enter Node name. Mark as Permanent agent and click Ok.

<p align="center">
<img src="/images/addNewNode.png" width="55%" height="55%">
</p>

3. Upadate No. of executors to 2,3 whatever. You can keep it 1 as well. This controls how many executors are allowed on a node to run in parallel.

4. Update remote root directory
```
/home/<user>
```
In my case, it is /user/kamal

5. Update labels. Set it to ubuntuNode1

6. Select Usage as : "Only Build jobs with label expressions matching this node". This restricts the executions meant for this node to run on this node only.

7. Select Launch method as "Launch agents via SSH". In case you do not see this opetion in dorpdown, you need to install SSH plugins on Jenkins.

<p align="center">
<img src="/images/sshPlugins.png" width="45%" height="45%">
</p>

8. Get the ip of ubuntu. Use this command on ubuntu terminal(Virtual machine/node).
```
ifconfig
```
<p align="center">
<img src="/images/ubuntu_ifconfig.png" width="65%" height="65%">
</p>

The host should be able to ping VM for communication. We have changed adapted to Bridge to make this possible.
To check this, you can run the command from host:

```
ping 192.168.29.119
```
where 192.168.29.119 is VM ip address in our case.

9. Enter VM's IP in "Host ip". In our case it is 192.168.29.119

10. Add credentials of VM in creadential manager(if not added already). Select that from dropdown for authentication.

11. Enter Host Key verification strategy as "Non verifying verification strategy"

12. Select Availability as "Bring this agent online when in demand and take offline when idle.". You can choose as per your requirement. This option enables node to be active only when needed. 

<p align="center">
<img src="/images/nodeAvailability.png" width="65%" height="65%">
</p>

13. Save.

14. Now run the pipeline using pipelin script. And it should work.

```
pipeline {
    agent {
        label 'ubuntuNode1'
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


15. Now if we use JENKINSFILE5 from github repo to build the pipeline, it may fail.

```
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
```
<p align="center">
<img src="/images/pipelineErrorDueToGitOnNode.png" width="65%" height="65%">
</p>

For this, you need to Configure the Node again. And towards the Bottom, you'll find Node Properties.
Check Tool Locations. Select Git default and set path as "/usr/bin/git"

<p align="center">
<img src="/images/gitOnNode.png" width="35%" height="35%">
</p>

Now it should work from JENKINSFILE as well.


<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>

# Installation on Ubuntu


### Step 1: Install Java

If you alread have java installed on your machine, you may skip this step.

Otherwise, let's continue and install java 8.

```
sudo apt update 
sudo apt install openjdk-8-jdk 
```

### Step 2: Install Jenkins

The default Ubuntu packages for Jenkins are always behind the current version of the project itself. You may use the project-maintained packages to install Jenkins to take advantage of the newest patches and features.

##### Add the framework repository key: 

```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add  
```

The device returns OK when the key is inserted. 


##### After this, we need to link the repository of Debian packages to the sources.list of the server: 

```
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

##### Update apt once again
```
sudo apt update
```

##### Install Jenkins
```
sudo apt install jenkins 
```

##### check Jenkins status
```
sudo systemctl status jenkins
```
<img src="/images/jenkinsOnUbuntuStatus.png" width="40%" height="40%">



<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>

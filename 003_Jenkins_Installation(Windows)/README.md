# Installation on Windows

The easiest way to install Jenkins on Windows is to use the Jenkins Windows installer. Though we can install Jenkins on linux, mac, dockers etc but in this complete series I'll be using Jenkins hosted from my windows machine. I am using jenkins war file instead of MSI installer. And there is no specific reason why I am doing so. 

[Download Link](https://www.jenkins.io/download/)

To launch jenkins using the war file, use this command:

```
java -jar jenkins.war
```

Make sure you have java installed before you run this command. Once it is up you can use jenkins at http://localhost:8080

First time it will ask for a password. You can open the file mentioned just above the password field and copy paste that initial password to login for the first time. Then you can set your profile.

After that it will ask for installation of some plugins.


## Github account, github plugin, github token

If you don't have a github account, then visit https://github.com/signup and create an account.

If you are not having Github plugins installed on Jenkins, then follow these steps

    a. Go to Manage Jenkins and then click on Manage Plugins.

<p align="center">
    <img src="/images/manage_jenkins.png" width="30%" height="30%">
</p>

    b. Install git and github plugins and restart jenkins.

<p align="center">
    <img src="/images/git_plugin.png" width="30%" height="30%">
</p>

<p align="center">
<img src="/images/github_plugin.png" width="30%" height="30%">
</p>


If you have not created a token for github authentication before, follow the steps:

    a. Go to settings.

<p align="center">
<img src="/images/settings.png" width="30%" height="30%">
</p>

    b. Click on Developer Settings.

<p align="center">
<img src="/images/developer_settings.png" width="30%" height="30%">
</p>

    c. Click on Personal Access token. Then click on Generate new token. Copy the token and save it somewhere for future reference.

    d. Go to credentials manager in Jenkins and add username and token for authentication.
<p align="center">
<img src="/images/github_credentials.png" width="60%" height="60%">
</p>

<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="25%" height="25%"></a>
</p>
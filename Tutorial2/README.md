# Tutorial 2. Github account, github plugin, github token


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
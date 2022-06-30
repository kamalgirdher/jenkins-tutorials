# Tutorial 10. Docker on VM(ubuntu) agent

*Case  - Jenkins on local --> Docker on local*

*Case - Jenkins on VM --> Docker on VM*

*Case  - Jenkins on local  -->  VM on Virtualbox  --> Docker on VM*

*Case  - Jenkins and Docker on remote hosts*


## Docker installation on Ubuntu

We are having a Windows machine on which we hosted Jenkins. We created an ubuntu VM on virtualbox. Now we are installing docker on that VM. Our target is to create an agent using docker. Let's first see installation of docker on ubuntu.

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

For more details, you may check the instructions here: https://docs.docker.com/engine/install/ubuntu/


## Docker image using Dockerfile
Now let's create a simple Hello World application and host it using nginx. We are threfore using nginx alpine base image and putting a simple HTML page on it.

First create a file and name it as Dockerfile.

```
vi Dockerfile
```

Then write below instructions in the file and save. 

```
FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
```

Then we need to create index.html file. Here is the content of index.html

```
<html>
<head>
<title>Hello world</title>
</head>
<body><h1>HELLO</h1></body>
</html>
```

## Set up script (run.sh) to run on container

After creating the dockerfile, we would want to run this dockerfile that will create an image. And we would be using containers from that image. Whenever we would be running a container, we would want to run a script. Let's create a new file and name it as run.sh

```
echo 'Here we go...' >> /usr/share/nginx/html/index.html
```

We are appending the text 'Here we go...' after the html in index.html. Though this won't make a proper html, yet it is enough to explain that run.sh was able to update the content. 
In real use cases, this script would be capable of building the code once we move the files.

Now, lets add steps in dockerfile to execute this run.sh.

```
FROM nginx:alpine
WORKDIR /ci
COPY index.html /usr/share/nginx/html
COPY /run.sh /ci/
RUN chmod 777 /ci/run.sh
RUN /ci/run.sh
```


## Build docker image in pipeline
Now this one is important. We want to run the Dockerfile to create an image. An image created after first run would stay on the VM. So, next time when we would try to run Dockerfile, it would throw error that image is already there. Therefore, we need to delete the image before we build the dockerfile to create an image.

The same thing we need to do for containers. Since the latest application changes would reflect only on a new container, therefore we need to remove all old containers before creating a new one.

We would be stopping & deleting the container in pre-build stage. And we will surround it by try..catch to catch the errors in case container with that name doesn't exist.

```
stage('pre -build') {
    steps {
        sh 'echo Pre-build'
        script {
            try{
                sh 'docker ps -q --filter "name=hello" | grep -q . && docker stop hello && docker rm -fv hello'
            }catch(Exception e){
                echo "No container found!"
            }
        }
    }
}
```

And in the "Build and Deploy" stage, we would delete the image(if exists), prune unused containers and then build.

```
stage('build and Deploy') {
    agent {
        label 'ubuntuNode1'
    }
    steps {
        script {
            try{
                docker image rm -f kamal
            }catch(Exception e){
                echo "Error while deleting image"
            }
            sh '''
            docker container prune -f
            docker build -t kamal ci/
            docker run -td --name hello -p 80:80 kamal
            '''
        }
    }
}
```

To see the complete script, you can sefer JENKINSFILE8 in this repository.


## Create container , Network settings

As we use docker run, it launches a container "hello" from the image "kamal". And the -p 80:80 will do the mapping of port 80 of VM with port 80 of docker container which also gets the same host IP.

<p align="center">
    <img src="/images/machineVmDocker.png" width="40%" height="40%">
</p>

And when we open <VM IP>:80 (eg. 192.168.29.119:80) from our root machine(Windows in our case), it opens the HTML page (index.html) with "Here we go..." text appended after Hello message.



Docker settings on Ubuntu

```
sudo systemctl edit docker.service
```

Update 127.0.0.1 to 0.0.0.0

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
```

Reload Daemon
```
sudo systemctl daemon-reload
```


Restart docker service
```
sudo systemctl restart docker.service
```








<p align="center">
    <img src="/images/helloNginxApp.png" width="40%" height="40%">
</p>
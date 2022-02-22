# Tutorial 10. Docker agent

## Docker installation

We are having a Windows machine on which we hosted Jenkins. We created an ubuntu VM on virtualbox. Now we are installing docker on that VM. Our target is to create an agent using docker. Let's first see installation of docker on ubuntu.

```
apt-get update
```


## Docker image using Dockerfile

Now let's create a simple Hello World application and host it using nginx. We are threfore using nginx alpine base image and putting a simple HTML page on it.

First create a file and name it as Dockerfile.

```
vi Dockerfile
```

Then write below instructions in the file and save. 

```
FROM nginx:alpine
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


## Build docker image in pipeline

## Create container , Network settings

## Linting

## Pipeline - Unit test

## Pipeline -Regression test through other container

## Clean workspace
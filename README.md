# Learn how to test Terraform locally with Docker Desktop and localstack

----------

## Step 1:
Create `main.tf` file

## Step 2:
Update `provider "docker"` to fix running locally with Docker Desktop
host = "unix:///home/`replaced with pc username`/.docker/desktop/docker.sock"

## Step 3:
```bash
foo@bar:~$ terraform init

foo@bar:~$ terraform apply
```

## Step 4:
Start the localstack docker container
```bash
foo@bar:~$ docker-compose up -d
```

## Step 5:
Clone below project
```bash
foo@bar:~$ git clone https://github.com/localstack/localstack-demo.git
```

## Step 6:
Deploy demo project to localstack docker container
```bash
foo@bar:~$ make deploy
```
To test above setup, visit the page [archive-bucket](http://localhost:4566/archive-bucket/index.html)
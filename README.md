# Learn how to test Terraform locally with Docker Desktop and localstack

----------

## Step 1:
Create `main.tf` file

## Step 2:
Update `provider "docker"` to fix running locally with Docker Desktop
host = "unix:///home/`replaced with pc username`/.docker/desktop/docker.sock"

## Step 2:
```console
foo@bar:~$ terraform init

foo@bar:~$ terraform apply
```
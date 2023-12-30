# Learn how to test Terraform locally with Docker Desktop and localstack

----------

## Step 1:
Create `main.tf` file

## Step 2:
Make sure you check on your pc with following command
```console
foo@bar:~$ docker context ls
```
Update `provider "docker"` to fix running locally with Docker Desktop
#### Linux
host = "unix:///home/`replaced with pc username`/.docker/desktop/docker.sock"
#### Mac
host = "unix:///Users/`replaced with pc username`/.docker/run/docker.sock"
#### Windows 10 and above (with WSL)
host = "npipe:////./pipe/dockerDesktopLinuxEngine"

## Step 3:
```console
foo@bar:~$ terraform init

foo@bar:~$ terraform apply
```
After this step, you will have nginx server running locally at [localhost:8000](http://localhost:8000) . Check Docker Desktop to see new container up and running

You can check `outputs` of container id with below command. You can add more log `outputs` in `outputs.tf` file
```console
foo@bar:~$ terraform output
```

## Step 4:
Start the localstack docker container
```console
foo@bar:~$ docker-compose up -d
```

## Step 5:
Clone below project
```console
foo@bar:~$ git clone https://github.com/localstack/localstack-demo.git
```

## Step 6:
Deploy demo project to localstack docker container
```console
foo@bar:~$ cd localstack-demo
```
```console
# On Mac or Linux
foo@bar:~$ make deploy

# On Windows 10 and above (with WSL), make sure you install serverless before run below script
foo@bar:~$ serverless deploy --stage local
```

To test above setup,
on `Mac` and `Linux`, visit the page [archive-bucket](http://localhost:4566/archive-bucket/index.html)
on `Windows`, visit the page [archive-bucket](http://localhost:4566/archive-bucket/demo/web/index.html)

----------
## Final step: Clean up
Remove all localstack containers
```console
# Move to root directory
foo@bar:~$ cd ..
# Run this bash to turn down service containers
foo@bar:~$ docker-compose down -v --remove-orphans
```

Remove nginx server at port 8000
```console
foo@bar:~$ terraform destroy
```

----------
### Tips and tricks
- Before editting the main.tf file, remember to `turn down all service containers`
- If network cannot be released, try to disconnect any container connected to that network

- Format all configurations
```console
foo@bar:~$ terraform fmt
```

- Validate configuration
```console
foo@bar:~$ terraform validate
```

- Check current state: content come from `terraform.tfstate`
```console
foo@bar:~$ terraform show
```

----------
## Terraform Cloud
This workflow is not working for `localstack` and Docker Desktop
```console
# Login
foo@bar:~$ terraform login

# Paste token from web

# Run init again
foo@bar:~$ terraform init

# Remove terraform state file
foo@bar:~$ rm terraform.tfstate
```
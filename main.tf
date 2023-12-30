terraform {
  # cloud {
  #   organization = "Terraform-Learning-FoxBunLong"
  #   workspaces {
  #     name = "terraform-learning-cli"
  #   }
  # }
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # Fix running locally with Docker Desktop
  # host = "unix:///home/<replace with pc username>/.docker/desktop/docker.sock"
  host = "unix:///home/thaybunlong/.docker/desktop/docker.sock"
}

resource "docker_image" "nginx" {
  name         = var.docker_image_nginx
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.instance_name # Changed from "tutorial" to "hello-cloud" > result in destroying old container and create a new one
  # name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}

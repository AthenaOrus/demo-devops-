terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name         = "rania975/demo-devops:latest"
  keep_locally = true
}

resource "docker_container" "site" {
  name  = "site-rania-terraform"
  image = docker_image.app.name
  ports {
    internal = 80
    external = 8080
  }
}
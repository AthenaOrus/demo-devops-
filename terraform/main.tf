terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "site" {
  name         = "rania975/demo-devops:latest"
  keep_locally = true
}

resource "docker_container" "site_container" {
  name  = "mon-site-devops"
  image = docker_image.site.name
  ports {
    internal = 80
    external = 8080
  }
}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Image Docker
resource "docker_image" "nginx" {
  name = "demo-devops-nginx:latest"
  build {
    context = "."
    tag     = ["demo-devops-nginx:latest"]
  }
}

# Conteneur Docker
resource "docker_container" "web" {
  name  = "demo-devops-container"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${path.cwd}/index.html"
    container_path = "/usr/share/nginx/html/index.html"
  }

  restart = "unless-stopped"
}
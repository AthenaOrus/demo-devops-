terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  # Pour Linux/Mac
  host = "unix:///var/run/docker.sock"
  
  # Pour Windows, décommenter la ligne suivante :
  # host = "npipe:////./pipe/docker_engine"
}

# Image Docker
resource "docker_image" "nginx" {
  name = "demo-devops-nginx:latest"
  build {
    context    = path.cwd
    dockerfile = "Dockerfile"
    tag        = ["demo-devops-nginx:latest"]
    no_cache   = true
  }
  
  # Force la reconstruction si le Dockerfile change
  triggers = {
    dockerfile_hash = filemd5("${path.cwd}/Dockerfile")
    html_hash       = filemd5("${path.cwd}/index.html")
  }
}

# Conteneur Docker
resource "docker_container" "web" {
  name  = "demo-devops-terraform"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  # Pas de volume - utilise la version dans l'image
  restart = "unless-stopped"
  
  # Force le remplacement si l'image change
  must_run = true
}
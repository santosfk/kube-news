terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.48.2"
    }
  }
}

data "digitalocean_ssh_key" "pc" {
  name = "pc"
}
# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "jenkins" {
  image   = "ubuntu-20-04-x64"
  name    = "jenkins"
  region  = "nyc2"
  size    = "s-1vcpu-2gb"
  ssh_keys = [data.digitalocean_ssh_key.pc.id]
}

resource "digitalocean_kubernetes_cluster" "primary" {
  name   = "primary"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.32.1-do.0"

  node_pool {
    name       = "apps"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
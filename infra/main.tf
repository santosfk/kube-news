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
  size    = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.pc.id]
}
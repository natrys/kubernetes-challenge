variable "digitalocean_access_token" {
  type = string
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_access_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "cluster"
  region  = "sgp1"
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 4
  }
}

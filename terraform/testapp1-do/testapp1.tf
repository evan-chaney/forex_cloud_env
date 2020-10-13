# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "testapp1" {
  image    = "centos-7-x64"
  name     = "testapp1"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "testapp1" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "testapp1"
  ttl    = 31
  value  = "${digitalocean_droplet.testapp1.ipv4_address}"
}

resource "digitalocean_droplet" "testapp2" {
  image    = "centos-7-x64"
  name     = "testapp2"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "testapp2" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "testapp2"
  ttl    = 31
  value  = "${digitalocean_droplet.testapp2.ipv4_address}"
}

resource "digitalocean_loadbalancer" "testapp1-lb" {
  name = "loadbalancer-testapp1"
  region = "nyc1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"
    target_port = 80
    target_protocol = "http"
  }
  forwarding_rule {
    entry_port = 443
    entry_protocol = "https"
    target_port = 443
    target_protocol = "https"
    tls_passthrough = true
  }

  healthcheck {
    port = 80
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.testapp1.id}", "${digitalocean_droplet.testapp2.id}"]
}

resource "digitalocean_record" "testapp1-lb" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "testapp1-lb"
  ttl    = 31
  value  = "${digitalocean_droplet.testapp1.ipv4_address}"
}
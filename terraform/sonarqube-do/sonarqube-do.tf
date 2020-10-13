# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "sonarqube1" {
  image    = "centos-7-x64"
  name     = "sonarqube1"
  region   = "nyc1"
  size     = "s-1vcpu-3gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "sonarqube1" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "sonarqube1"
  ttl    = 31
  value  = "${digitalocean_droplet.sonarqube1.ipv4_address}"
}

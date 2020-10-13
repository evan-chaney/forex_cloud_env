# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "mydb1" {
  image    = "centos-7-x64"
  name     = "mydb-1"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "mydb1" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "mydb1"
  value  = "${digitalocean_droplet.mydb1.ipv4_address}"
}
resource "digitalocean_droplet" "mydb2" {
  image    = "centos-7-x64"
  name     = "mydb-2"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "mydb2" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "mydb2"
  value  = "${digitalocean_droplet.mydb2.ipv4_address}"
}
resource "digitalocean_droplet" "mydb3" {
  image    = "centos-7-x64"
  name     = "mydb-3"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}
resource "digitalocean_record" "mydb3" {
  domain = "ezchaney.com"
  type   = "A"
  name   = "mydb3"
  value  = "${digitalocean_droplet.mydb3.ipv4_address}"
}
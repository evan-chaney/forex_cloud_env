# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "consul1" {
  image    = "centos-7-x64"
  name     = "consul1"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}

//resource "digitalocean_droplet" "vault1" {
//  image    = "centos-7-x64"
//  name     = "vaul11"
//  region   = "nyc1"
//  size     = "s-2vcpu-2gb"
//  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
//}

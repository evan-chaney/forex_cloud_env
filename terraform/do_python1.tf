# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "backtest1" {
  image    = "centos-7-x64"
  name     = "backtest-1"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}

resource "digitalocean_droplet" "backtest2" {
  image    = "centos-7-x64"
  name     = "backtest-2"
  region   = "nyc1"
  size     = "s-2vcpu-2gb"
  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
}

//resource "digitalocean_droplet" "backtest3" {
//  image    = "centos-7-x64"
//  name     = "backtest-3"
//  region   = "nyc1"
//  size     = "s-2vcpu-2gb"
//  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
//}
//
//resource "digitalocean_droplet" "backtest4" {
//  image    = "centos-7-x64"
//  name     = "backtest-4"
//  region   = "nyc1"
//  size     = "s-2vcpu-2gb"
//  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
//}
//
//resource "digitalocean_droplet" "backtest5" {
//  image    = "centos-7-x64"
//  name     = "backtest-5"
//  region   = "tor1"
//  size     = "s-2vcpu-2gb"
//  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
//}
//
//resource "digitalocean_droplet" "backtest6" {
//  image    = "centos-7-x64"
//  name     = "backtest-6"
//  region   = "tor1"
//  size     = "s-2vcpu-2gb"
//  ssh_keys = ["24:7b:45:54:92:87:55:65:72:d1:19:2d:33:fd:89:ba"]
//}

//data "digitalocean_droplet" "backtest1" {
//  name       = "backtest-1"
//  depends_on = ["digitalocean_droplet.backtest1"]
//}

//data "digitalocean_droplet" "backtest2" {
//  name       = "backtest-2"
//  depends_on = ["digitalocean_droplet.backtest2"]
//}

//output "backtest1_ip" {
//  value = "${digitalocean_droplet.backtest1.ipv4_address}"
//}

//output "backtest2_ip" {
//  value = "${digitalocean_droplet.backtest2.ipv4_address}"
//}

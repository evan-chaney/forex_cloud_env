# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "kube1" {
  name    = "kube1"
  region  = "nyc1"
  version = "1.14.4-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}


provider "kubernetes" {
  host = "${digitalocean_kubernetes_cluster.kube1.endpoint}"

  client_certificate     = "${base64decode(digitalocean_kubernetes_cluster.kube1.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(digitalocean_kubernetes_cluster.kube1.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(digitalocean_kubernetes_cluster.kube1.kube_config.0.cluster_ca_certificate)}"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
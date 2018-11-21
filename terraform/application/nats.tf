resource "kubernetes_deployment" "nats" {
  metadata {
    name = "nats"
    labels {
      component = "nats"
      app = "todo-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        component = "nats"
      }
    }

    template {
      metadata {
       labels {
        component = "nats"
        app = "todo-app"
        version = "v1"
        }
      }

      spec {
        container {
          image = "nats:linux"
          name  = "todo-messaging"

          port {
              name = "client"
              container_port = "4222"
          }

          port {
              name = "cluster"
              container_port = "6222"
          }

          port {
              name = "monitor"
              container_port = "8222"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nats" {
  metadata {
    name = "nats-service"
  }
  spec {
    selector {
      app = "${kubernetes_deployment.nats.metadata.0.labels.app}"
    }
    port {
      name = "client"
      port = 6565
      target_port = 4222
    }

    port {
      name = "cluster"
      port = 6566
      target_port = 6222
    }

    port {
      name = "monitor"
      port = 6567
      target_port = 8222
    }
    type = "NodePort"
  }
}


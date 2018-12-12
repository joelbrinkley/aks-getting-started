resource "kubernetes_deployment" "webapp" {
  metadata {
    name = "todo-webapp-deployment"
     labels {
      app = "todo-webapp"
      component = "todo-service"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "todo-app"
        component = "todo-webapp"
      }
    }

    template {
      metadata {
       labels {
        component = "todo-webapp"
        app = "todo-app"
        version = "v2"
        }
      }

      spec {
        container {
          image = "joelvbrinkley/todo-webapp:v2"
          name  = "todo-webapp"

          env {
             name = "ASPNETCORE_ENVIRONMENT"
             value = "K8s"
          }

          env {
             name = "NatsConnection"
             value = "nats://natscluster-nats-client:4222"
          }

          port {
              container_port = "80"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp" {
  metadata {
    name = "todo-webapp-service"
  }
  spec {
    selector {
      component = "todo-webapp"
      version = "v2"
    }
    port {
      name = "http"
      port = 51101
      target_port = 80
    }

    type = "LoadBalancer"
  }
}


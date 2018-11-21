resource "kubernetes_deployment" "todo_service" {
  metadata {
    name = "todo-service-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "todo-app"
        component = "todo-service"
      }
    }

    template {
      metadata {
       labels {
        component = "todo-service"
        app = "todo-app"
        version = "v1"
        }
      }

      spec {
        container {
          image = "joelvbrinkley/todo-service:v1"
          name  = "todo-service"

          env {
             name = "NATS_CONNECTION"
             value = "nats://nats-service:6565"
          }
        }
      }
    }
  }
}


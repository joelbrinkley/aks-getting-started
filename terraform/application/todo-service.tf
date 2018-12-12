resource "kubernetes_deployment" "todo_service" {
  metadata {
    name = "todo-service-deployment"
    labels {
      app = "todo-app"
      component = "todo-service"
    }
  }

  spec {
    replicas = 3

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
        version = "v2"
        }
      }

      spec {
        container {
          image = "joelvbrinkley/todo-service:v2"
          name  = "todo-service"

          env {
             name = "NATS_CONNECTION"
             value = "nats://natscluster-nats-client:4222"
          }
        }
      }
    }
  }
}
resource "kubernetes_deployment" "webapp" {
  metadata {
    name = "todo-webapp-deployment"   
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
        version = "v1"
        }
      }

      spec {
        container {
          image = "joelvbrinkley/todo-webapp:v1"
          name  = "todo-webapp"

          env {
             name = "ASPNETCORE_ENVIRONMENT"
             value = "K8s"
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
      app = "${kubernetes_deployment.webapp.metadata.0.labels.app}"
      version = "v1"
    }
    port {
      name = "http"
      port = 51101
      target_port = 80
    }

    type = "LoadBalancer"
  }
}


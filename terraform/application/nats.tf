resource "helm_release" "nats_cluster" {
    name      = "natscluster"
    chart     = "stable/nats"
    values = [
      "${file("values.yml")}"
  ]
}
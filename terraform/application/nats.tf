resource "helm_release" "nats_cluster" {
    name      = "natscluster"
    chart     = "stable/nats"
    set {
        name="auth.enabled"
        value = "false"
    }
}
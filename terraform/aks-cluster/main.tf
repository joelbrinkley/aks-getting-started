provider "azurerm" {
    subscription_id   = "${var.subscription_id}"
    client_id         = "${var.client_id}"
    client_secret     = "${var.client_secret}"
    tenant_id         = "${var.tenant_id}"
}

module "aks" "aks" {
    source              = "../modules/aks"
    cluster_name        = "jb-aks-cluster"
    agent_count         = 1
    dns_prefix          = "jbaks"
    client_id           = "${var.client_id}"
    client_secret       = "${var.client_secret}"
}


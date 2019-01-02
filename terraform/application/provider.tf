terraform {
    backend "azurerm" {    
        key = "app.terraform.tfstate"
    }
}

data "azurerm_kubernetes_cluster" "aks" {
    name                = "${var.aks_cluster_name}"
    resource_group_name = "${var.aks_cluster_resource_group}"
}

provider "kubernetes" {
    host                   = "${data.azurerm_kubernetes_cluster.aks.kube_config.0.host}"
    username               = "${data.azurerm_kubernetes_cluster.aks.kube_config.0.username}"
    password               = "${data.azurerm_kubernetes_cluster.aks.kube_config.0.password}"
    client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
    client_key             = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
    cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
}




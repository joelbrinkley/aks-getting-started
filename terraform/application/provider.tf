terraform {
    backend "azurerm" {    
        key = "app.terraform.tfstate"
    }
}

data "terraform_remote_state" "aks" {
    backend = "azurerm"
    config {
        key = "aks.terraform.tfstate"
        storage_account_name = "${var.storage_account_name}"
        container_name = "${var.container_name}"
        access_key = "${var.access_key}"
    }
}

provider "kubernetes" {
    host                   = "${data.terraform_remote_state.aks.host}"
    client_certificate     = "${base64decode(data.terraform_remote_state.aks.client_certificate)}"
    client_key             = "${base64decode(data.terraform_remote_state.aks.client_key)}"
    cluster_ca_certificate = "${base64decode(data.terraform_remote_state.aks.cluster_ca_certificate)}"
    load_config_file  = false
}




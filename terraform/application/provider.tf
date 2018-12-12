
provider "kubernetes" {
    host                    = "${var.host}"
    client_certificate      = "${base64decode(var.client_certificate)}"
    client_key              = "${base64decode(var.client_key)}"
    cluster_ca_certificate  = "${base64decode(var.cluster_ca_certificate)}"
    load_config_file        = false
    insecure                = "${var.insecure}"
}

provider "helm" {
    kubernetes {
        host                    = "${var.host}"
        client_certificate      = "${base64decode(var.client_certificate)}"
        client_key              = "${base64decode(var.client_key)}"
        cluster_ca_certificate  = "${base64decode(var.cluster_ca_certificate)}"
        insecure                = "${var.insecure}"
    }
}



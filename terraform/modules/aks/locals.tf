locals {
    cluster_rg_name = "${var.cluster_name}-rg",
    tags = {
        owner = "Joel Brinkley"
        creator = "Joel Brinkley",
        environment = "${terraform.workspace}"
    }
}

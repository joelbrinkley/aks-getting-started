variable "cluster_name" {
    default = "MyAksCluster"
    description = "The name of the AKS cluster"
}

variable "agent_count" {
    default = 1
    description = "The number of agents in the cluster"
}

variable "region" {
    default = "centralus"
    description = "Region to deploy resources"
}

variable "dns_prefix" {
    description = "DNS prefix for the AKS cluster"
}

variable "client_id" {
    description = "client id for cluster"
}

variable "client_secret" {
    description = "client secret for cluster"
}
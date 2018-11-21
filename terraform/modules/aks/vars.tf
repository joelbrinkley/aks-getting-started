variable "cluster_name" {
    default = "MyAksCluster"
    description = "The name of the AKS cluster"
}

variable "agent_count" {
    default = 1
    description = "The number of agents in the cluster"
}

variable "dns_prefix" {
    
}

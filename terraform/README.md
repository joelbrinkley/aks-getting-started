# Terraform and AKS

## Setup AKS Cluster

### Create SPN //USING TERRAFORM TO MANAGE USERS
### Create Resource

## Deploy Application
## TALK ABOUT SEPERATION OF LIFECYCLE of APP and K8s

### Kubernetes Provider

## Setup Local Cluster

# Switch to Local K8s but use terraform


├terraform
├── aks-cluster
│   ├── main.tf
│   ├── vars.tf
├── application
│   ├── nats.tf
│   ├── todo-service.tf
│   ├── todo-web.tf
│   ├── vars.tf
├── modules
│   ├── aks
│   │   ├── locals.tf
│   │   ├── README.md
│	│	├── outputs.tf
│   │   ├── vars.tf
│   ├── service_principal
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
├── azure.tfvars
├── local.tfvars
├── README.md
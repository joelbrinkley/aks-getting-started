variable "client_id" {
  description = "Access key for Azure"
}

variable "client_secret" {
  description = "Secret Key for Azure"
}

variable "subscription_id" {
  description = "Subscription ID"
}

variable "tenant_id" {
  description = "Tenant ID"
}

variable "region" {
    default = "centralus"
    description = "Region to deploy resources"
}
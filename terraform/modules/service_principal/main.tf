
data "azurerm_subscription" "current" {}

resource "random_string" "password" {
  length  = 32
  special = true
}

locals {
  spn_password = "${random_string.password.result}"
}

resource "azurerm_azuread_application" "main" {
  name = "${var.name}"
}

resource "azurerm_azuread_service_principal" "main" {
  application_id = "${azurerm_azuread_application.main.application_id}"
}

resource "azurerm_azuread_service_principal_password" "main" {
  service_principal_id = "${azurerm_azuread_service_principal.main.id}"
  value                = "${local.spn_password}"
  end_date             = "${var.expiration}"
}

resource "azurerm_role_assignment" "test" {
  scope                = "${data.azurerm_subscription.primary.id}"
  role_definition_name = "${var.role}"
  principal_id         = "${azurerm_azuread_service_principal.main.id}"

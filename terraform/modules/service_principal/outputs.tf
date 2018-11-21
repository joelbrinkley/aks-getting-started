output "id" {
  value = "${azurerm_azuread_service_principal.main.id}"
}

ouput "client_id" {
  value = "${azurerm_azuread_service_principal.main.application_id}"
}

output "client_secret" {
  value = "${random_string.password.result}"
}
output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "container_group_name" {
  description = "Name of the Azure Container Instance"
  value       = azurerm_container_group.aci.name
}

output "container_public_ip" {
  description = "Public IP address of the Azure Container Instance"
  value       = azurerm_container_group.aci.ip_address
}

output "container_fqdn" {
  description = "Website URL of the Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}
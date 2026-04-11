output "resource_group_name" {
    description = "Resource Groupin nimi"
    value = azurerm_resource_group.main.name
}

output "resource_group_location" {
    description = "Resource Groupin sijainti"
    value = azurerm_resource_group.main.location
}
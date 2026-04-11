terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "main" {
  name = "asp-harkka"
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = "Windows"
  sku_name = "F1"
}

resource "azurerm_windows_web_app" "main" {
  name = "app-harkka-stara-vv"
  resource_group_name = var.resource_group_name
  location = var.location
  service_plan_id = azurerm_service_plan.main.id

  site_config {
    always_on = false
  }
}
provider "azurerm" {
  features {}
}

locals {
  tags = {
    environment = "test"
  }
}

data "azurerm_client_config" "current" {}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${random_id.this.hex}"
  location = var.location

  tags = local.tags
}

module "log_analytics" {
  source = "git::https://github.com/JatinRautela/azurerm-log-analytics.git"

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  tags = local.tags
}

module "key_vault" {
  # source = "git::https://github.com/JatinRautela/azurerm-key-vault.git"
  source = "../.."

  vault_name                 = "kv-${random_id.this.hex}"
  resource_group_name        = azurerm_resource_group.this.name
  location                   = azurerm_resource_group.this.location
  log_analytics_workspace_id = module.log_analytics.workspace_id

  access_policies = [
    {
      object_id          = data.azurerm_client_config.current.object_id
      secret_permissions = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover"]
    }
  ]

  tags = local.tags
}

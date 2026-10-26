data "azurerm_client_config" "this" {}

locals {
  legacy_access_policies = {
    logged_in_user = merge(
      var.key_vault.legacy_access_policies.logged_in_user,
      {
        object_id = data.azurerm_client_config.this.object_id
      }
    )
  }
}

module "keyvault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.9.1"

  location            = azurerm_resource_group.this.location
  name                = var.key_vault.name
  resource_group_name = azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.this.tenant_id
  sku_name = var.key_vault.sku_name

  enable_telemetry = var.enable_telemetry

  legacy_access_policies_enabled = true
  legacy_access_policies = local.legacy_access_policies
}
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# -------------------------------------------------
# Resource Group (match existing CAF RG)
# -------------------------------------------------
resource "azurerm_resource_group" "this" {
  name     = var.resource_group.name
  location = var.resource_group.location

  tags = var.resource_group.tags
}

# -------------------------------------------------
# AVM Virtual Machine (creates NIC + VM + managed data disks)
# -------------------------------------------------
module "vm" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.18.0"
  

  # Core
  name                = var.vm.name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
 

  # Required by your AVM VM module schema
  sku_size = var.vm.sku_size
  zone                    = var.vm.zone 


  # OS / auth
  os_type        = var.vm.os_type
  admin_username = var.vm.admin_username
  license_type   = var.vm.license_type

  # Image
  source_image_reference = var.vm.source_image_reference

  # OS Disk
  os_disk = var.vm.os_disk

  # Identity (optional, but supports SystemAssigned)
  managed_identities = var.vm.managed_identities

  # NIC (created/configured by module)
  network_interfaces = var.network_interfaces

  # Managed data disks (created + attached by module) — bursting supported
  data_disk_managed_disks = var.data_disk_managed_disks

  encryption_at_host_enabled = false 


  run_commands = {}
  run_commands_secrets = {}
}

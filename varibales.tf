variable "resource_group" {
  description = "Resource group detailsSS"
  type = object({
    name     = string
    location = string
    tags     = map(string)
  })
}


# -----------------------------
# VM settings (AVM schema-aligned)
# -----------------------------
variable "vm" {
  description = "Virtual machine settings aligned to AVM module inputs."
  type = object({
    name                    = string
    sku_size = string
    zone                    = number

    os_type        = string
    admin_username = string
    license_type   = string

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    os_disk = object({
      name                 = optional(string)
      caching              = string
      storage_account_type = string
      disk_size_gb         = optional(number)
    })

    # Optional identity map. For SystemAssigned, set system_assigned = true.
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
  })
}

# -----------------------------
# Network interfaces (passed directly to AVM)
# -----------------------------
variable "network_interfaces" {
  description = "NIC definitions for the AVM VM module."
  type = map(object({
    name = string

    # Optional NIC-level settings (only include if you actually use them in tfvars)
    ip_forwarding_enabled   = optional(bool, false)
    internal_dns_name_label = optional(string)

    # Required by the AVM example pattern
    ip_configurations = map(object({
      name                          = string
      private_ip_subnet_resource_id = string

      private_ip_address_allocation = optional(string, "Dynamic")
      private_ip_address            = optional(string)

      # Optional public IP fields if ever needed:
      create_public_ip_address = optional(bool, false)
      public_ip_address_name   = optional(string)
    }))
  }))
}


variable "protected_parameters" {
  description = "Optional protected parameters for VM run-command. Leave empty unless using run-command."
  type        = any
  default     = {}
}

# -----------------------------
# Managed data disks created + attached by AVM VM module
# -----------------------------
variable "data_disk_managed_disks" {
  description = "Managed data disks to create and attach to the VM (bursting supported)."
  type = map(object({
    name                        = string
    storage_account_type        = string
    create_option               = optional(string, "Empty")
    disk_size_gb                = number
    lun                         = number
    caching                     = optional(string, "None")

    # Your key requirement:
    on_demand_bursting_enabled  = optional(bool)


    # Optional performance tuning
    disk_iops_read_write        = optional(number)
    disk_mbps_read_write        = optional(number)

    tags                        = optional(map(string))
  }))
}

#-----------------------------------

variable "enable_telemetry" {
  description = "Enable AVM module telemetry."
  type        = bool
  default     = true
}

variable "key_vault" {
  description = "Key Vault configuration."
  type = object({
    name     = string
    sku_name = string
    
    legacy_access_policies = object({
        logged_in_user = object({
          secret_permissions = list(string)
         
        })
      })
    })
}

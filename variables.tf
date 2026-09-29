# Global settings
variable "global_settings" {
  default = {
    passthrough    = true
    default_region = "region1"
    regions = {
      region1 = "northeurope"
      region2 = "westeurope"
    }
  }
}

# Map of the remote data state for lower level
variable "lower_storage_account_name" {}
variable "lower_container_name" {}
variable "lower_resource_group_name" {}

variable "tfstate_storage_account_name" {}
variable "tfstate_container_name" {}
variable "tfstate_key" {}
variable "tfstate_resource_group_name" {}

variable "landingzone" {
  default = {}
}

variable "tenant_id" {
  default = null
}

variable "current_landingzone_key" {
  default = "standalone"
}

variable "tfstates" {
  default = {}
}

variable "enable" {
  description = "Map of services defined in the configuration file you want to disable during a deployment"
  default     = {}
}
variable "environment" {
  default = "demo"
}

variable "logged_user_objectId" {
  description = "Used to set access policies based on the value 'logged_in_user'. Can only be used in interactive execution with vscode."
  default     = null
}
variable "logged_aad_app_objectId" {
  description = "Used to set access policies based on the value 'logged_in_aad_app'"
  default     = null
}

variable "use_msi" {
  default = false
}

variable "tags" {
  type    = map(any)
  default = null
}

variable "resource_groups" {
  description = "Name of the existing resource group to deploy the virtual machine"
  default     = {}
}

variable "subscriptions" {
  default = {}
}

variable "remote_objects" {
  description = "Remote objects is used to allow the landing zone to retrieve remote tfstate objects and pass them to the caf module"
  default     = {}
}

## Diagnostics settings
variable "diagnostics_definition" {
  default     = null
  description = "Shared diadgnostics settings that can be used by the services to enable diagnostics"
}

variable "diagnostics_destinations" {
  default = null
}

variable "log_analytics" {
  default = {}
}

variable "diagnostics" {
  default = {}
}

variable "event_hub_namespaces" {
  default = {}
}

variable "user_type" {
  description = "The rover set this value to user or serviceprincipal. It is used to handle Azure AD api consents."
  default     = {}
}

## Azure AD
variable "azuread_apps" {
  default = {}
}

variable "azuread_groups" {
  default = {}
}

variable "azuread_roles" {
  default = {}
}

variable "azuread_users" {
  default = {}
}

variable "azuread_api_permissions" {
  default = {}
}

## Compute variables
variable "compute" {
  description = "Compute object"
  default = {
    virtual_machines = {}
  }
}
variable "aks_clusters" {
  default = {}
}

variable "webapp" {
  default = {}
}

## Databases variables
variable "database" {
  default = {}
}

## Networking variables
variable "networking" {
  default = {}
}

## Security variables
variable "security" {
  default = {}
}

variable "managed_identities" {
  default = {}
}

variable "keyvaults" {
  default = {}
}

variable "availability_sets" {
  default = {}
}

variable "keyvault_access_policies" {
  default = {}
}

variable "keyvault_access_policies_azuread_apps" {
  default = {}
}

variable "custom_role_definitions" {
  default = {}
}
variable "role_mapping" {
  default = {
    built_in_role_mapping = {}
    custom_role_mapping   = {}
  }
}

## Storage variables
variable "storage_accounts" {
  default = {}
}
variable "storage" {
  default = {}
}
variable "diagnostic_storage_accounts" {
  default = {}
}

# Shared services
variable "shared_services" {
  default = {}
}

variable "monitoring" {
  default = {}
}

variable "rover_version" {
  default = null
}

variable "app_service_environments" {
  default = {}
}
variable "app_service_plans" {
  default = {}
}
variable "app_services" {
  default = {}
}
variable "network_security_group_definition" {
  default = {}
}
variable "vnets" {
  default = {}
}
variable "azurerm_redis_caches" {
  default = {}
}
variable "mssql_servers" {
  default = {}
}
variable "mssql_databases" {
  default = {}
}
variable "mssql_elastic_pools" {
  default = {}
}
variable "virtual_machines" {
  default = {}
}
variable "bastion_hosts" {
  default = {}
}
variable "public_ip_addresses" {
  default = {}
}
variable "private_dns" {
  default = {}
}
variable "synapse_workspaces" {
  default = {}
}
variable "azurerm_application_insights" {
  default = {}
}
variable "databricks_workspaces" {
  default = {}
}
variable "machine_learning_workspaces" {
  default = {}
}
variable "virtual_wans" {
  default = {}
}
variable "application_gateways" {
  default = {}
}
variable "application_gateway_applications" {
  default = {}
}

variable "tfstate_subscription_id" {
  default = {}
}

variable application_gateway_waf_policies {
  default = {}
}

variable mysql_servers {
  default = {}
}

variable mysql_databases {
  default = {}
}

variable mssql_managed_instances {
  default = {}
}

variable route_tables {
  default = {}
}
variable azurerm_routes {
  default = {}
}
variable vnet_peerings {
  default = {}
}
variable vhub_peerings {
  default = {}
}
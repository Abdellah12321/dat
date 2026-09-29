module "landingzone_datainsights" {
  source  = "./aztf/no-vm-prefix"
  #version = "~>5.7.12"

  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  apim                        = var.apim
  current_landingzone_key     = var.landingzone.key
  tenant_id                   = var.tenant_id
  tags                        = local.tags
  diagnostics                 = local.diagnostics
  global_settings             = local.global_settings
  tfstates                    = local.tfstates
  diagnostic_storage_accounts = var.diagnostic_storage_accounts
  logged_user_objectId        = var.logged_user_objectId
  logged_aad_app_objectId     = var.logged_aad_app_objectId
  resource_groups             = var.resource_groups
  storage_accounts            = var.storage_accounts
  #azuread_groups              = var.azuread_groups
  keyvaults                   = var.keyvaults
  keyvault_access_policies    = var.keyvault_access_policies
  managed_identities          = var.managed_identities
  role_mapping                = var.role_mapping
  event_hub_namespaces        = var.event_hub_namespaces
  webapp = {
    azurerm_application_insights = var.azurerm_application_insights
    app_service_environments     = var.app_service_environments
    app_service_plans            = var.app_service_plans
    app_services                 = var.app_services
  }
  compute = {
    virtual_machines  = var.virtual_machines
    bastion_hosts     = var.bastion_hosts
    aks_clusters      = var.aks_clusters
    availability_sets = var.availability_sets
  }
  networking = {
    vnets                             = var.vnets
    network_security_group_definition = var.network_security_group_definition
    public_ip_addresses               = var.public_ip_addresses
    private_dns                       = var.private_dns
    virtual_wans                      = var.virtual_wans
    application_gateways              = var.application_gateways
    application_gateway_applications  = var.application_gateway_applications
    application_gateway_waf_policies  = var.application_gateway_waf_policies
    route_tables                      = var.route_tables
    azurerm_routes                    = var.azurerm_routes
    vnet_peerings                     = var.vnet_peerings
    vhub_peerings                     = var.vhub_peerings

  }
  database = {
    azurerm_redis_caches        = var.azurerm_redis_caches
    mssql_servers               = var.mssql_servers
    mssql_databases             = var.mssql_databases
    mssql_elastic_pools         = var.mssql_elastic_pools
    synapse_workspaces          = var.synapse_workspaces
    databricks_workspaces       = var.databricks_workspaces
    machine_learning_workspaces = var.machine_learning_workspaces
    mysql_servers               = var.mysql_servers
    mysql_databases             = var.mysql_databases
    mssql_managed_instances      = var.mssql_managed_instances
  }
  shared_services = {
    monitoring = var.monitoring
  }
  enable = {}

  remote_objects = {
    vnets = local.remote.vnets
  }
}

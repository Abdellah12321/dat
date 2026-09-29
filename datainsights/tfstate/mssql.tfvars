mssql_servers = {
  Data_insights_server = {
    name                = "data_insights_server"
    region              = "region1"
    resource_group_key  = "prod-data-insights-uks"
    version             = "12.0"
    administrator_login = "sqladmin"
    minimum_tls_version = "1.2"
    #Removin azure ad_administrator block
    /*azuread_administrator = {
      azuread_group_id      = "b345bc0c-acfa-4d30-9979-baeb6cb10912"
      tenant_id             = "a708279d-de88-4b62-9560-85a6be8c08cc"
      login_username        = "AZ_SERVICE_data-insights_SQL_ADMINS"
    }
    */
    # Generate a random password and store it in keyvaul secret
    keyvault_key                  = "prod_data_insights_kv"
    connection_policy             = "Default"
    system_msi                    = true
    public_network_access_enabled = false

   

    identity = {
      type = "SystemAssigned"
    }

    private_endpoints = {
      # Require enforce_private_link_endpoint_network_policies set to true on the subnet
      private-link-level3 = {
        name       = "data-insights-sql-rg1"
        vnet_key   = "prod_spoke_data_insights_workload_uks"
        subnet_key = "subnet1"
        resource_group_key = "prod-data-insights-uks"

        private_service_connection = {
          name                 = "data-insights-sql-rg1"
          is_manual_connection = false
          subresource_names    = ["sqlServer"]
        }

        private_dns = {
           zone_group_name = "privatelink_database_windows_net"
        #   # lz_key          = ""   # If the DNS keys are deployed in a remote landingzone
           keys = ["privatelink"]
        }

      }
    }
    
  }
}


mssql_databases = {
  All_Staff_data_insights = {
    resource_group_key = "prod-data-insights-uks"
    mssql_server_key   = "Data_insights_server"
    name               = "prod-data-insights-uks"
    #license_type       = "LicenseIncluded"
    #license_type       = "BasePrice"
    #collation    = "SQL_Latin1_General_CP1_CI_AS" #added lines 62-66 Steve H
    #max_size_gb  = 32
    #sku_name     = "S0"
    #enclave_type = "VBS"
    geo_backup_enabled = true
  }


}






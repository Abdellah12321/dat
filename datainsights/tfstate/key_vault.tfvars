keyvaults = {
  prod_data_insights_kv = {
    name               = "data-insights"
    resource_group_key = "prod-data-insights-uks"
    sku_name           = "standard"
    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
  
  


}

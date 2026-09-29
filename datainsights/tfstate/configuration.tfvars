landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "shared_services"
  level               = "level3"
  key                 = "prod_data_insights"
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "caf_shared_services.tfstate"
    }
    networking_hub = {
      level   = "lower"
      tfstate = "caf_networking.tfstate"
    }
  }
}


resource_groups = {
  prod-data-insights-uks = {
    name   = "prod-data-insights-uks"
    region = "region1"
    tags   = {
        BusinessImpact = "High"
        BusinessUnit = "IS"
        CostCode = "122"
        CreationDate = "26/08/2025"
        DecomDate = "N/A"
        OperatingHours = "24x7"
        ProductOwner = "Technology Ops"
        Service = "data-insights"
        }
  } 
}

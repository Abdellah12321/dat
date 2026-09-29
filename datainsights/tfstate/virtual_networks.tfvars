# This section contains the code for creating the virtual networks and subnet resources
vnets = {
  prod_spoke_data_insights_workload_uks = {
    resource_group_key = "prod-data-insights-uks"
    region             = "region1"
    vnet = {
      name          = "prod-data-insights-uks-001"
      address_space = ["10.71.26.0/24"]
      dns_servers   = ["10.70.1.4", "10.70.1.5"]
    }
    subnets = {
      subnet1 = {
        name              = "subnet1-prod-data-insights-uks-001"
        cidr              = ["10.71.26.0/26"]
        service_endpoints = ["Microsoft.Sql"]
        nsg_key           = "ofsted_placeholder_nsg"
        route_table_key   = "data_insights_default_to_prod_firewall_uks"
      },

      subnet2 = {
        name            = "subnet2-prod-data-insights-uks-001"
        cidr            = ["10.71.26.64/27"]
        nsg_key         = "ofsted_placeholder_nsg"
        route_table_key = "data_insights_default_to_prod_firewall_uks"
        #service delegation for web apps
        /*delegation = {
          name = "web2"
          service_delegation = "Microsoft.Web/serverFarms"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action"
          ]
        } */
      },
    }
  }
}
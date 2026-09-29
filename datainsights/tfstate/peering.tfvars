# This section contains code that peers or connects two virtual networks together. By default, virtual networks have no connectivity to other virtual networks unless explicitly stated.
#  
vnet_peerings = {
  prod_hub_uks_TO_prod_spoke_data_insights_reporting = {
    name = "hub_uks_TO_data_insights_reporting"
    from = {
      lz_key   = "networking_hub"
      vnet_key = "prod_hub_uks"
    }
    to = {
      vnet_key = "prod_spoke_data_insights_workload_uks"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = true
    use_remote_gateways          = false
  }

  prod_spoke_data_insights_TO_prod_hub_uks = {
    name = "hub_spoke_data_insights_TO_hub_uks"
    from = {
      vnet_key = "prod_spoke_data_insights_workload_uks"
    }
    to = {
      lz_key   = "networking_hub"
      vnet_key = "prod_hub_uks"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = true
  }

}

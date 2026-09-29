# Creation of the Azure route table resource, actual routes are configured in the next section
route_tables = {
  data_insights_default_to_prod_firewall_uks = {
    name               = "data_insights-default-to-prod-firewall-uks"
    resource_group_key = "prod-data-insights-uks"
    disable_bgp_route_propagation = true
  }
}

# Networking route are defined here, where these are deployed is contained within the code below
azurerm_routes = {
  data_insights_default_to_firewall_uks = {
    name               = "0-0-0-0-through-prod-firewall-uks"
    resource_group_key = "prod-data-insights-uks"
    route_table_key    = "data_insights_default_to_prod_firewall_uks"
    address_prefix     = "0.0.0.0/0"
    next_hop_type      = "VirtualAppliance"
    next_hop_in_ip_address = "10.70.0.68"


    # To be set when next_hop_type = "VirtualAppliance"
    private_ip_keys = {
      azurerm_firewall = {
        # this didnt work - lz_key          = "networking_hub"
        key             = "fw_prod_uks"
        interface_index = 0
      }
      # virtual_machine = {
      #   key = ""
      #   nic_key = ""
      # }
    }
  }
}

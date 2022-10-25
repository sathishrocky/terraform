resource "azurerm_private_dns_zone" "tfdns" {
  name                = "test.com"
  resource_group_name = azurerm_resource_group.rg.name
}

data "azurerm_virtual_network" "exvnet" {
  name                = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
  name                  = "vnetlink1"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.tfdns.name
  virtual_network_id    = data.azurerm_virtual_network.exvnet.id
  registration_enabled = "true"
}
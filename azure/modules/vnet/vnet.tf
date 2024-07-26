resource "azurerm_virtual_network" "vnet" {
  name                = var.vent_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags

}

resource "azurerm_subnet" "azsubnet" {
  name                 = var.subet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vent_name
  address_prefixes     = ["10.0.0.0/24"]
  depends_on           = [azurerm_virtual_network.vnet]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}


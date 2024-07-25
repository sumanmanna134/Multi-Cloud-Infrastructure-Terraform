resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = var.subnet_ids
  }
  tags = var.tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.storage_account]


}

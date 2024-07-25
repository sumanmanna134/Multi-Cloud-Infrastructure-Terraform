resource "azurerm_resource_group" "resourcegrp" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

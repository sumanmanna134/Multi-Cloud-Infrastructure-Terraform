
module "rg" {
  source              = "../modules/azure-modules/resource-grp"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

}

module "vnet" {
  source              = "../modules/azure-modules/vnet"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  vent_name           = var.vent_name
  subet_name          = var.subet_name
  tags                = var.tags
  depends_on          = [module.rg]

}



module "storage" {
  source               = "../modules/azure-modules/storage"
  resource_group_name  = module.rg.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  subnet_ids           = [module.vnet.subnet_id]
  container_name       = var.container_name
  depends_on           = [module.rg, module.vnet]
  tags                 = var.tags
}











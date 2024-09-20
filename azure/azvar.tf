variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "dev"
  }

}

variable "subet_name" {
  type = string

}

variable "vent_name" {
  type = string

}

variable "subnet_ids" {
  default = [null]
  type    = list(string)
}

variable "container_name" {
  type = string

}
variable "subscription_id" {

}
variable "client_id" {

}
variable "client_secret" {

}
variable "tenant_id" {

}





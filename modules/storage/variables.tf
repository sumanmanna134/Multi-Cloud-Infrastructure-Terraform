variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the storage account"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "subnet_ids" {
  default = [null]
  type    = list(string)
}

variable "tags" {
  type = map(string)

}

variable "container_name" {
  type = string

}


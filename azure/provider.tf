terraform {

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "azure_website_gh_action"
    workspaces {
      name = "azure_website_gh_action"
    }

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }

    github = {
      source  = "integrations/github"
      version = "5.25.0"
    }
  }

}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

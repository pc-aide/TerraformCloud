########################################################
# TERRAFORM
########################################################

terraform {
  required_version = "~>1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.19.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.0"
    }
  }
}

########################################################
# PROVIDERS
########################################################

provider "azurerm" {
  features {}
  skip_provider_registration = true

  # Connection to Azure
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "random" {
  # Configuration options
}

########################################################
# DATA
########################################################

resource "random_integer" "sbn_name_suffix" {
  min = 1000
  max = 9999
}

########################################################
# RESOURCE_GROUP
########################################################

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}

########################################################
# SERVICEBUS_NAMESPACE
########################################################

resource "azurerm_servicebus_namespace" "sbn-lab01" {
  name                = "${var.sbn_name}${random_integer.sbn_name_suffix.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_name.name
  sku                 = var.sbn_sku
}

resource "azurerm_servicebus_queue" "sbn_queue" {
  name         = var.sbn_queue_name
  namespace_id = azurerm_servicebus_namespace.sbn-lab01.id
}

// SAS Policy for queue name
resource "azurerm_servicebus_queue_authorization_rule" "sbn_queue_auth_rul" {
  name     = var.sbn_queue_auth_rul_name
  queue_id = azurerm_servicebus_queue.sbn_queue.id

  send = true
}

########################################################
# OUTPUT
########################################################

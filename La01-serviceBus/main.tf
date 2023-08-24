########################################################
# PROVIDERS
########################################################

provider "azurerm" {
  version = "<=2.0.0"

  subscription_id = var.subscriptionID
  client_id = var.clientID
  client_secret = var.clientSecret
  tenant_id = var.tenantID
}

########################################################
# RESOURCE_GROUP
########################################################

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
}

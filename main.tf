resource "azurerm_resource_group" "rg1" {
  # azure resouce group
  name     = "hs-az-rg"
  location = var.resource_group_location

  tags = {
    source = "terraform"
  }
}


resource "azurerm_resource_group" "rg1" {
  # azure resouce group
  name     = "hs-az-rg"
  location = var.resource_group_location

  tags = {
    source = "terraform"
  }
}

resource "azuread_user" "user1" {
  # my azure account
  user_principal_name = var.main_azure_username

}

resource "azuread_user" "user2" {
  # trainer's azure account
  user_principal_name = "ibrahimozbekler@hashicorp.com"
  force_password_change = true
}

resource "aws_s3_bucket" "b" {
  count = 2
  name = "s3-bucket"
  location = var.resource_group_location
}

locals {
  aws_user_settings = {
    "aws_user1"  = { name = "Ali.Ottman" },
    "aws_user2"   = { name = "Jieyao.Deng"},
    "aws_user3" = { name = "Timarcus.Tate"},
    "aws_user4"    = { name = var.classmate_name}
  }
}

resource "aws_iam_user" "aws_user" {
  # aws users
  for_each = local.aws_user_settings

  name = each.value.name

}

resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_acc_name
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location

  tags = {
      environment = "staging"
    }
}



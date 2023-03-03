terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-east-1"
}
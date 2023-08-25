terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.39.0"
    }
    experimental = ["module_variable_optional_attrs"]
  }
}
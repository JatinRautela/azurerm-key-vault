# azurerm-key-vault

# Azure Key Vault Terraform Module

This Terraform module deploys an Azure Key Vault with customizable access policies, network settings, and diagnostic settings.

## Resources Created

- Azure Key Vault
- Monitor Diagnostic Setting for Key Vault

## Prerequisites

Before using this Terraform module, ensure that you have the following prerequisites:

1. **Azure Account**: You need an active Azure account to deploy the resources.
2. **Terraform**: Install Terraform on your local machine. You can download it from the [official Terraform website](https://www.terraform.io/downloads.html).
3. **Azure CLI**: Install the Azure CLI on your local machine. You can download it from the [Azure CLI website](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

- Terraform version >= 1.3.0 is required.
- Azure provider version >= 3.16.0 is required.

## Configure Azure Provider

To configure the Azure provider, you need to set up the necessary Azure credentials. If you already have the Azure CLI installed and authenticated with Azure, Terraform will use the same credentials.

If you haven't authenticated with Azure, you can do so by running:

```bash
az login
```


## Clone the Repository

First, clone this repository to your local machine using the following command:

```bash
git clone <repository_url>
cd <repository_name>
```

## Initialize Terraform

Once you have cloned the repository, navigate to the module directory and initialize Terraform:

```bash
cd path/to/module_directory
terraform init
```

This will download the necessary plugins required for Terraform to work with Azure.

## Apply the Terraform Configuration

After configuring the input variables, you can apply the Terraform configuration to create the Azure Container Group:

```bash
terraform apply
```

Terraform will show you the changes that will be applied to the infrastructure. Type `yes` to confirm and apply the changes.

## Clean Up

To clean up the resources created by Terraform, you can use the `destroy` command:

```bash
terraform destroy
```

Terraform will show you the resources that will be destroyed. Type `yes` to confirm and destroy the resources.


## Inputs

| Name                                       | Description                                  | Type         | Default                        |
|--------------------------------------------|----------------------------------------------|--------------|--------------------------------|
| `vault_name`                               | The name of the Key Vault.                  | `string`     |                                |
| `resource_group_name`                      | The name of the resource group.             | `string`     |                                |
| `location`                                 | The location for the Key Vault.             | `string`     |                                |
| `soft_delete_retention_days`                | Retention days for soft-deleted items.     | `number`     | `90`                           |
| ... (other input variables)                | ...                                          | ...          | ...                            |

## Outputs

| Name                                      | Description                                  | Type         |
|-------------------------------------------|----------------------------------------------|--------------|
| `vault_id`                                | The ID of the Key Vault.                    | `string`     |
| `vault_name`                              | The name of the Key Vault.                  | `string`     |
| `vault_uri`                               | The URI of the Key Vault.                   | `string`     |
| ... (other output variables)               | ...                                          | ...          |

## Example Usage

```hcl
module "key_vault" {
  source = "path/to/module"

  vault_name                = "mykeyvault"
  resource_group_name       = "myresourcegroup"
  location                  = "East US"
  soft_delete_retention_days = 60
  ... (other input variables)
}

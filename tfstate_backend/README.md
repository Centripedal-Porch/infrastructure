# tfstate_backend

This directory contains the configuration for CentriPedal Porch's Terraform
state S3 backend.

## Software Requirements

* [AWS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Usage

### First Apply

1. Ensure that the above softwares are installed and authenticated on your
   system.
1. Comment out the `backend` configuration block in `providers.tf`.
1. Initialize Terraform and apply the configuration:

   ```sh
   terraform init -backend=false
   terraform apply
   ```

1. Un-comment the `backend` config block in `providers.tf`.
1. Re-initialize terraform.

   ```sh
   terraform init -migrate-state
   ```

### Subsequent Applications and Updates

1. Upgrade the Terraform cache:

   ```sh
   terraform init -upgrade
   ```

1. Test/plan/apply the new configuration:

   ```sh
   terraform test
   terraform plan
   terraform apply
   ```

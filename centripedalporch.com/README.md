# centripedalporch.com

This directory contains the configuration for CentriPedal Porch's cloud
infrastructure.

## Software Requirements

* [AWS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [Hugo](https://gohugo.io/getting-started/quick-start/)

## Usage

### Infrastructure Deployments

1. Ensure that the above softwares are installed and authenticated on your
   system.
1. Initialize Terraform:

   ```sh
   terraform init -upgrade
   ```

1. Test/plan/apply:

   ```sh
   terraform test
   terraform plan
   terraform apply
   ```

### Website Development

## Recommended Reading

* [AWS Prescriptive Guidance](https://docs.aws.amazon.com/prescriptive-guidance)
* [Hugo Documentation](https://gohugo.io/documentation)
* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)

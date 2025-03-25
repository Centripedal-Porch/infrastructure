# centripedalporch.com

This directory contains the configuration for CentriPedal Porch's cloud
infrastructure.

## Dependencies

### Required Softwares

* [AWS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [Hugo](https://gohugo.io/getting-started/quick-start/)

### Recommended Softwares

* [GitHub CLI](https://cli.github.com)
* [markdownlint](https://github.com/markdownlint/markdownlint)
* [nektos/act](https://github.com/nektos/act)
* [yamllint](https://pypi.org/project/yamllint)

## Usage

### Infrastructure Deployments

1. Ensure that the above softwares are installed and authenticated on your
   system.
1. Initialize Terraform:

   ```sh
   terraform init --upgrade
   ```

1. Test/plan/apply:

   ```sh
   terraform test
   terraform plan
   terraform apply --var-file={ENVIRONMENT}.tfvars
   ```

### Website Development

1. Make edits to the markdown files in
   `centripedalporch.com/frontends/www/content/` as needed.
1. Run `hugo --minify` to build the site, or `hugo server` to render it live.
1. Run `terraform apply --var-file={ENVIRONMENT}.tfvars` to deploy the site.

## Recommended Reading

* [AWS Prescriptive Guidance](https://docs.aws.amazon.com/prescriptive-guidance)
* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Hugo Documentation](https://gohugo.io/documentation)

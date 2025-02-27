# tfstate_backend

This directory contains the configuration for CentriPedal Porch's Terraform
state S3 backend.

## Software Requirements

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Infracost](https://www.infracost.io/docs)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Setup

1. Log into the AWS CLI: `aws configure sso`.
1. Install Terraform providers: `terraform init --upgrade`.

## Deployment

**NB:** Future changes to this repository should include automated deployments
via GitHub Actions CI/CD.

1. _If your manifest changes include provider upgrades, then_ upgrade the
   Terraform cache: `terraform init --upgrade`
1. Test the new manifests: `terraform test`
1. Update values in [.infracost.yml](./.infracost.yml) to align with new
   resource usage and expected load.
1. Return to the root git directory and cost out the deployment:
   `cd $(git rev-parse --show-toplevel) && infracost breakdown --config-file
   ./.infracost.yml`
1. Make sure that cloud costs are within an expected/acceptable range.
1. Commit the new changes to your feature branch **with a useful commit
   message**.
1. Open a pull request to the `main` branch and wait for codeowner approval.
1. Once approved, merge your branch to `main` and let the codeowner know that
   the manifests are ready for deployment.

## Recommended Reading

* [Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials)
* [Trunk-based development](https://trunkbaseddevelopment.com) with git.
* Using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0)
   to write useful commit messages.

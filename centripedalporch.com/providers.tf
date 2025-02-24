###############################################################################
# Terraform and Providers
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform/provider/backend state configuration.

## Terraform ==================================================================
terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0.0"
    }
  }

  backend "s3" {
    region       = "us-west-2"
    bucket       = "centripedalporch-tfstate-hgejbh5oj7x654ic"
    key          = "centripedalporch.com.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}

## Providers ==================================================================
provider "aws" { #                                                              AWS
  region = var.aws_region

  default_tags {
    tags = {
      terraform = true
      domain    = var.root_domain
    }
  }
}

provider "cloudflare" { api_token = var.cloudflare_api_token } #                Cloudflare

## Outputs ====================================================================
output "aws_region" {
  description = "Region to which tf config is deployed."
  value       = var.aws_region
  sensitive   = false
}

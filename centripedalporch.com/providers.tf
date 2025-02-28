###############################################################################
# Terraform and Providers
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform/provider/backend state configuration.

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
}

## Terraform ==================================================================
terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.88.0"
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

provider "cloudflare" { #                                                       Cloudflare
  api_token = data.aws_secretsmanager_secret_version.cloudflare_token.secret_string
  #api_token = var.cloudflare_api_token
}

## Data =======================================================================
data "aws_caller_identity" "current" {}

data "aws_secretsmanager_secret" "cloudflare_token" {
  arn = "arn:aws:secretsmanager:${var.aws_region}:${local.aws_account_id}:secret:cloudflare/api_token"
}

data "aws_secretsmanager_secret_version" "cloudflare_token" {
  secret_id = data.aws_secretsmanager_secret.cloudflare_token.id
}

## Outputs ====================================================================
output "aws_region" {
  description = "Region to which tf config is deployed."
  value       = var.aws_region
  sensitive   = false
}

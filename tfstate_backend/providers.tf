###############################################################################
# Terraform and Providers
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform/provider/backend state configuration

locals {
  common_tags = {
    terraform = true
    service   = "tfstate"
  }
}

terraform {
  backend "s3" {
    region       = "us-west-2"
    bucket       = "centripedalporch-tfstate-hgejbh5oj7x654ic"
    key          = "backend.tfstate"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.3"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags { tags = local.common_tags }
}

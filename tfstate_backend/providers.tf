###############################################################################
# Terraform and Providers
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform/provider/backend state configuration

locals {}

# Terraform ===================================================================
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
      version = "~> 6.3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
  }
}

# Providers ===================================================================
provider "aws" { #                                                              AWS
  region = var.aws_region

  default_tags {
    tags = {
      terraform = true
      service   = "tfstate"
    }
  }
}

provider "random" {} #                                                          Random

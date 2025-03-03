###############################################################################
# Terraform and Providers
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform/provider/backend state configuration

terraform {
  required_providers {
    assert = {
      source  = "hashicorp/assert"
      version = "~> 0.15.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.89.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }
  }
}

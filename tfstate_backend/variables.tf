###############################################################################
# Variables
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  Terraform configuration variables.

# AWS =========================================================================
variable "aws_region" {
  description = "AWS region to deploy to."
  type        = string
  sensitive   = false
  default     = "us-west-2"
}

# Misc. =======================================================================
variable "resource_prefix" {
  description = "Name of the AWS bucket to create."
  type        = string
  sensitive   = false
  default     = "centripedalporch-tfstate"
}

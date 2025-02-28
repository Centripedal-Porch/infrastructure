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

variable "aws_terraform_state_iam_group_members" {
  description = "List of AWS account users who should be able to access Terraform S3 backend/state files."
  type        = list(string)
  sensitive   = false
  default     = ["terraform_admin"]
}

# Misc. =======================================================================
variable "resource_prefix" {
  description = "Name of the AWS bucket to create."
  type        = string
  sensitive   = false
  default     = "centripedalporch-tfstate"
}

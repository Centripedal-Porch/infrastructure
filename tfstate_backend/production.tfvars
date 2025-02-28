###############################################################################
# Production TFvars
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Usage:        Terraform variables for production instance.
# Notes:        This file is commited to SCM. Keep it **dry**!!

# Variables ===================================================================
aws_region                            = "us-west-2"
resource_prefix                       = "centripedalporch-tfstate"
aws_terraform_state_iam_group_members = ["terraform_admin"]

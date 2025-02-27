###############################################################################
# tftest Setup
#
# Author:       Casey Sparks
# Date:         February 27, 2025
# Description:  Setup steps for Terraform tests.

locals {}

## Resources ==================================================================
resource "random_string" "suffix" {
  length  = 16
  lower   = true
  upper   = false
  numeric = true
  special = false
}

## Outputs ====================================================================
output "random_suffix" { value = random_string.suffix.result }

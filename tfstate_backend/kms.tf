###############################################################################
# AWS KMS
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  AWS Key Management Service config.

# Resources ===================================================================
resource "aws_kms_key" "terraform_state" {
  description             = "KMS key for terraform state S3 bucket objects."
  deletion_window_in_days = 30
  is_enabled              = true
  tags = merge(
    { service = "kms" },
    local.common_tags
  )
}

resource "aws_kms_alias" "terraform_state" {
  name          = replace("alias/${aws_s3_bucket.terraform_state.id}", ".", "-")
  target_key_id = aws_kms_key.terraform_state.key_id
}

# Outputs =====================================================================
output "aws_kms_key" {
  description = "ID of the KMS key used to encrypt Terraform state."
  value       = aws_kms_key.terraform_state.key_id
}

output "aws_kms_key_alias" {
  description = "Alias of the KMS key used to encrypt Terraform state."
  value       = aws_kms_alias.terraform_state.name
}

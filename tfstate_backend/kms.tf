###############################################################################
# AWS KMS
#
# Author:       Casey Sparks
# Date:         February 04, 2025
# Description:  AWS Key Management Service config.

# Resources ===================================================================
resource "aws_kms_key" "terraform_state" {
  description             = "KMS key for terraform state S3 bucket objects."
  is_enabled              = true
  deletion_window_in_days = 30
  enable_key_rotation     = true
  tags                    = { service = "kms" }
}

resource "aws_kms_alias" "terraform_state" {
  name          = replace("alias/${aws_s3_bucket.terraform_state.id}", ".", "-")
  target_key_id = aws_kms_key.terraform_state.key_id
}

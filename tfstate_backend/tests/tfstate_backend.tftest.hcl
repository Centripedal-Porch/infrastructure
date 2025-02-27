###############################################################################
# tfstate_backend Tests
#
# Author:       Casey Sparks
# Date:         February 27, 2025
# Description:  Tests for the Terraform state backend S3 bucket.

## Providers ==================================================================
mock_provider "aws" {}

provider "assert" {}

## Tests ======================================================================
run "setup_tests" {
  module { source = "./tests/setup" }
}

run "check_s3_bucket_settings" {
  command = apply

  variables {
    aws_region = "us-west-2"
    bucket_prefix = "tfstate-backend-test"
  }

  assert {
    condition = can(regex("^${var.bucket_prefix}-[a-z0-9]{16}$", aws_s3_bucket.terraform_state.bucket))
    error_message = "Invalid bucket name."
  }

  assert { #                                                                    Check ACL settings
    condition = aws_s3_bucket_acl.terraform_state.acl == "private"
    error_message = "Dangerous bucket ACL for ${aws_s3_bucket.terraform_state.bucket}"
  }

  assert { #                                                                    Check bucket public access
    condition = aws_s3_bucket_public_access_block.terraform_state.block_public_acls == true
    error_message = "Dangerous bucket ACL for ${aws_s3_bucket.terraform_state.bucket}"
  }

  assert {
    condition = aws_s3_bucket_public_access_block.terraform_state.block_public_policy == true
    error_message = "Dangerous bucket ACL for ${aws_s3_bucket.terraform_state.bucket}"
  }

  assert {
    condition = aws_s3_bucket_public_access_block.terraform_state.ignore_public_acls == true
    error_message = "Dangerous bucket ACL for ${aws_s3_bucket.terraform_state.bucket}"
  }

  assert {
    condition = aws_s3_bucket_public_access_block.terraform_state.restrict_public_buckets == true
    error_message = "Dangerous bucket ACL for ${aws_s3_bucket.terraform_state.bucket}"
  }
}

run "check_kms_key_settings" {
  command = plan

  variables {
    bucket_prefix = "tfstate-backend-test"
  }

  assert { #                                                                    Key enabled
    condition = aws_kms_key.terraform_state.is_enabled == true
    error_message = "KMS key is not enobled"
  }

  assert { #                                                                    Key enabled
    condition = aws_kms_key.terraform_state.deletion_window_in_days <= 30
    error_message = "KMS key is not enobled"
  }
}

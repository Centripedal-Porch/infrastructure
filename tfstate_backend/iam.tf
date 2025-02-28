###############################################################################
# IAM
#
# Author:       Casey Sparks
# Date:         February 28, 2025
# Description:  IAM policies for S3 backend.

locals {}

## Data =======================================================================
data "aws_iam_policy_document" "access_terraform_state" {
  statement {
    sid    = "TfStateS3GetObjectAndKmsDecrypt"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
      "kms:Decrypt",
      "kms:Encrypt",
    ]
    resources = [
      aws_s3_bucket.terraform_state.arn,
      "${aws_s3_bucket.terraform_state.arn}/*",
      aws_kms_key.terraform_state.arn,
    ]
  }
}

## Resources ==================================================================
resource "aws_iam_group" "terraform_state" {
  name = "${var.resource_prefix}-iam-users"
  path = "/users/"
}

resource "aws_iam_group_membership" "administrator" {
  name  = "${aws_iam_group.terraform_state.name}-membership"
  group = aws_iam_group.terraform_state.name
  users = var.aws_terraform_state_iam_group_members
}

resource "aws_iam_policy" "access_terraform_state" {
  name        = "${var.resource_prefix}-access-s3-terraform_state"
  policy      = data.aws_iam_policy_document.access_terraform_state.json
  description = "Allow ${aws_iam_group.terraform_state.name} members to access ${aws_s3_bucket.terraform_state.id}."
}

resource "aws_iam_group_policy_attachment" "access_terraform_state" {
  group      = aws_iam_group.terraform_state.name
  policy_arn = aws_iam_policy.access_terraform_state.arn
}

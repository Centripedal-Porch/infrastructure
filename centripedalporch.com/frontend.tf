###############################################################################
# Frontend Configuration
#

# Data Objects ================================================================
data "aws_iam_policy_document" "s3_public_read_access" {
  statement {
    sid     = "PublicReadGetObject"
    actions = ["s3:GetObject"]
    resources = [
      aws_s3_bucket.carrd_site.arn,
      "${aws_s3_bucket.carrd_site.arn}/*",
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

# Resources ===================================================================
# Cloudflare ------------------------------------------------------------------
resource "cloudflare_dns_record" "cname_web_root" {
  zone_id = local.cloudflare_zone_id
  name    = var.root_domain
  content = aws_s3_bucket_website_configuration.web_root.website_endpoint
  type    = "CNAME"
  ttl     = 1
  proxied = false
  comment = local.cloudflare_comment
}

resource "cloudflare_dns_record" "cname_www_root" {
  zone_id = local.cloudflare_zone_id
  name    = "www.${var.root_domain}"
  content = aws_s3_bucket_website_configuration.carrd_site.website_endpoint
  type    = "CNAME"
  ttl     = 1
  proxied = false
  comment = local.cloudflare_comment
}

# S3 --------------------------------------------------------------------------
# WWW site --------------------------------------------------------------------
resource "aws_s3_bucket" "carrd_site" {
  bucket        = "www.${var.root_domain}"
  force_destroy = true
  tags          = local.common_tags
}

resource "aws_s3_bucket_website_configuration" "carrd_site" {
  bucket = aws_s3_bucket.carrd_site.id

  index_document { suffix = "index.html" }
  error_document { key = "404.html" }
}

resource "aws_s3_bucket_ownership_controls" "carrd_site" {
  bucket = aws_s3_bucket.carrd_site.id

  rule { object_ownership = "BucketOwnerPreferred" }
}

resource "aws_s3_bucket_public_access_block" "carrd_site" {
  bucket                  = aws_s3_bucket.carrd_site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "carrd_site" {
  depends_on = [
    aws_s3_bucket_ownership_controls.carrd_site,
    aws_s3_bucket_public_access_block.carrd_site,
  ]
  bucket = aws_s3_bucket.carrd_site.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "carrd_site" {
  bucket = aws_s3_bucket.carrd_site.id
  policy = data.aws_iam_policy_document.s3_public_read_access.json
}

# Redirect root ---------------------------------------------------------------
resource "aws_s3_bucket" "web_root" {
  bucket        = var.root_domain
  force_destroy = true
  tags          = local.common_tags
}

resource "aws_s3_bucket_website_configuration" "web_root" {
  bucket = aws_s3_bucket.web_root.id

  redirect_all_requests_to { host_name = aws_s3_bucket.carrd_site.id }
}

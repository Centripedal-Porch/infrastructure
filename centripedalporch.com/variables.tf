###############################################################################
# Variables
#

## AWS ========================================================================
variable "aws_region" {
  type        = string
  description = "AWS region to deploy to."
  sensitive   = false
  default     = "us-west-2"
}

## Cloudflare =================================================================
variable "spf_senders" {
  type        = list(string)
  description = "List of allowed SPF senders, like: [\"include:_spf.example.com\", \"ip4:127.0.0.1\"]."
  sensitive   = false
  default     = ["mx"]
}

variable "txt_records" {
  type        = map(string)
  description = "List of TXT records for domain."
  sensitive   = false
  default     = {}
}

## GitHub =====================================================================
variable "github_repositories" {
  description = "Map of GitHub repositories and their (non-default) settings."
  type        = map(map(string))
  sensitive   = false
}

## Misc. ======================================================================
variable "root_domain" {
  type        = string
  description = "Root domain of Terraform infrastructure."
  sensitive   = false
  default     = "centripedalporch.com"
}

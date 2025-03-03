###############################################################################
# Main
#

locals {
  common_tags = {
    terraform = true
    domain    = var.root_domain
  }
  hugo_dir = "frontends/www"
}

# Modules =====================================================================
module "artifacts" {
  source      = "git@github.com:caseysparkz/infrastructure.git//modules/s3_artifacts"
  root_domain = var.root_domain
  common_tags = local.common_tags
}

module "www" {
  source                        = "git@github.com:caseysparkz/infrastructure.git//modules/hugo_static_site"
  root_domain                   = var.root_domain
  subdomain                     = "demo.${var.root_domain}"
  artifact_bucket_id            = module.artifacts.s3_bucket_id
  site_title                    = var.root_domain
  hugo_dir                      = abspath(local.hugo_dir)
  js_contact_form_template_path = abspath("${local.hugo_dir}/static/js/contactForm.js.tftpl")
  common_tags                   = local.common_tags
}

###############################################################################
# Production Variables
#

# Misc. =======================================================================
root_domain = "centripedalporch.com"

# AWS =========================================================================
aws_region = "us-west-2"

# Cloudflare ==================================================================
spf_senders = ["mx"]
txt_records = {}

# GitHub ======================================================================
github_repositories = {
  infrastructure = {
    description                             = "Monorepo for CentriPedal Porch's codebase"
    visibility                              = "public"
    has_issues                              = true
    has_discussions                         = true
    has_wiki                                = true
    is_template                             = false
    allow_merge_commit                      = false
    allow_squash_merge                      = true
    allow_rebase_merge                      = true
    allow_auto_merge                        = true
    squash_merge_commit_title               = "PR_TITLE"
    squash_merge_commit_message             = "COMMIT_MESSAGES"
    delete_branch_on_merge                  = true
    web_commit_signoff_required             = true
    auto_init                               = false
    archived                                = false
    archive_on_destroy                      = true
    vulnerability_alerts                    = true
    ignore_vulnerability_alerts_during_read = true
    allow_update_branch                     = true
  }
  TEMPLATE = { description = "" }
}

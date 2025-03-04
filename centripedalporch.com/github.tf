###############################################################################
# GitHub
#
# Author:       Casey Sparks
# Date:         January 28, 2025
# Description:  Configuration for the 'caseyspar-kz' GitHub organization.

locals {
  github_org_name = "CentriPedal-Porch"
  github_default_repo = {
    description                             = ""
    visibility                              = "private"
    has_issues                              = false
    has_discussions                         = false
    has_wiki                                = false
    is_template                             = false
    allow_merge_commit                      = false
    allow_squash_merge                      = true
    allow_rebase_merge                      = true
    allow_auto_merge                        = true
    squash_merge_commit_title               = "PR_TITLE"
    squash_merge_commit_message             = "COMMIT_MESSAGES"
    delete_branch_on_merge                  = true
    web_commit_signoff_required             = false
    auto_init                               = false
    archived                                = false
    archive_on_destroy                      = true
    vulnerability_alerts                    = true
    ignore_vulnerability_alerts_during_read = true
    allow_update_branch                     = true
  }
}


## Resources ==================================================================
## Org. Settings --------------------------------------------------------------
resource "github_organization_settings" "caseysparkz" {
  /* General Settings ------------------------------------------------------ */
  name          = local.github_org_name
  email         = "contact@${var.root_domain}"
  description   = ""
  blog          = "https://www.${var.root_domain}"
  billing_email = "github@${var.root_domain}"
  location      = "United States of America"
  company       = "Centripedal Porch"

  /* Member Privileges ----------------------------------------------------- */
  has_organization_projects                                    = true
  has_repository_projects                                      = true
  default_repository_permission                                = "read"
  members_can_create_repositories                              = false
  members_can_create_pages                                     = false
  members_can_fork_private_repositories                        = false
  web_commit_signoff_required                                  = false
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true

  /* UNUSED VARIABLES
  advanced_security_enabled_for_new_repositories = true #                       Wrong license plan.
  */
}

resource "github_repository" "repo" {
  for_each = {
    for k, v in var.github_repositories :
    k => merge(local.github_default_repo, v)
  }
  name                                    = each.key
  description                             = each.value.description
  visibility                              = each.value.visibility
  has_issues                              = each.value.has_issues
  has_discussions                         = each.value.has_discussions
  has_wiki                                = each.value.has_wiki
  is_template                             = each.value.is_template
  allow_merge_commit                      = each.value.allow_merge_commit
  allow_squash_merge                      = each.value.allow_squash_merge
  allow_rebase_merge                      = each.value.allow_rebase_merge
  allow_auto_merge                        = each.value.allow_auto_merge
  squash_merge_commit_title               = each.value.squash_merge_commit_title
  squash_merge_commit_message             = each.value.squash_merge_commit_message
  delete_branch_on_merge                  = each.value.delete_branch_on_merge
  web_commit_signoff_required             = each.value.web_commit_signoff_required
  auto_init                               = each.value.auto_init
  archived                                = each.value.archived
  archive_on_destroy                      = each.value.archive_on_destroy
  vulnerability_alerts                    = each.value.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = each.value.ignore_vulnerability_alerts_during_read
  allow_update_branch                     = each.value.allow_update_branch

  template {
    owner                = local.github_org_name
    repository           = "TEMPLATE"
    include_all_branches = false
  }
}

resource "github_branch" "main" {
  for_each   = var.github_repositories
  repository = each.key
  branch     = "main"
}

resource "github_branch_default" "main" {
  for_each   = github_branch.main
  repository = each.value.repository
  branch     = each.value.branch
}

## Outputs ====================================================================

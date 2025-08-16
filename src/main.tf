resource "github_repository" "main" {
  name       = var.repository
  visibility = var.visibility

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

  allow_auto_merge       = true
  allow_update_branch    = true
  delete_branch_on_merge = true
}

resource "github_repository_ruleset" "main" {
  enforcement = "disabled"

  name       = "main"
  repository = github_repository.main.name
  target     = "branch"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true

    pull_request {
      dismiss_stale_reviews_on_push     = false
      require_code_owner_review         = false
      require_last_push_approval        = false
      required_approving_review_count   = 0
      required_review_thread_resolution = false
    }
  }
}



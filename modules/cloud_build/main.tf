resource "google_cloudbuild_trigger" "myTrigger" {
  count    = var.number_of_triggers
  filename = var.yamlfile
  trigger_template {
    branch_name = var.branch_list[count.index]
    repo_name   = var.repo_name
  }
}

resource "google_cloudbuild_trigger" "bucketTrigger" {
  filename = var.yamlfile
  trigger_template {
    branch_name = var.bucket-branch-name
    repo_name   = var.bucket-repo_name
  }
}
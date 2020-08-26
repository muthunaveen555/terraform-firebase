resource "google_cloudbuild_trigger" "myTrigger" {
  count    = var.number_of_triggers
  filename = "cloudbuild.yaml"
  trigger_template {
    branch_name = var.branch_list[count.index]
    repo_name   = var.repo_name
  }
}
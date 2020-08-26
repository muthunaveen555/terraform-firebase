resource "google_cloudbuild_trigger" "myTrigger" {
  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repo_name
  }
  filename = "cloudbuild.yaml"
}
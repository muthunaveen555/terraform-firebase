resource "google_storage_bucket" "default" {
  project = var.project-id
  name    = var.bucket_name
  versioning {
    enabled = "true"
  }
}
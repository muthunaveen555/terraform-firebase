resource "google_project" "default" {
    provider = google-beta
    project_id = "terraform-firebase"
    name       = "terraform-firebase"
}


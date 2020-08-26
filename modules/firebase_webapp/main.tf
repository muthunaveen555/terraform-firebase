resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = var.project-id
  display_name = "dream-11-project"

}
